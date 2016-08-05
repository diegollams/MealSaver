//
//  ViewController.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/17/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var meals = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" ,let destination = segue.destinationViewController as? ShowMealVC ,let index = tableView.indexPathForSelectedRow?.row{
            if let meal = Meal(nsmanageObject: meals[index]){
                destination.meal = meal
                print("showDetail")
            }
        }
    }
    
    func getManageContext() -> NSManagedObjectContext{
        let appDelegeta = UIApplication.sharedApplication().delegate as! AppDelegate
        
        return appDelegeta.managedObjectContext
    }
    
    func loadData(){
        let manageContext = getManageContext()
        let fetchRequest = NSFetchRequest(entityName: "Meal")
        
        do{
            let result =  try manageContext.executeFetchRequest(fetchRequest)
            meals = result as! [NSManagedObject]
            self.tableView.reloadData()
        }catch{
            print("error")
        }
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("Meal", forIndexPath: indexPath) as? MealCell{
            cell.setMeal(meals[indexPath.row])
            return cell
        }else{
            let cell = MealCell()
            return cell
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let manageContext = getManageContext()
            manageContext.deleteObject(meals[indexPath.row])
            do{
                try manageContext.save()
            }catch {
                print("error")
            }
            meals.removeAtIndex(indexPath.row)  
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}

