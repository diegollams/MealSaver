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
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func loadData(){
        let appDelegeta = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let manageContext = appDelegeta.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Meal")
        
        do{
            let result =  try manageContext.executeFetchRequest(fetchRequest)
            meals = result as! [NSManagedObject]
        }catch{
            print("eror")
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
}

