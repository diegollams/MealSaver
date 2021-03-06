//
//  NewMealVC.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/20/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit
import CoreData

class NewMealVC: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.addTarget(self, action: #selector(self.checkValidMeal), forControlEvents: .EditingChanged)
        descTextField.addTarget(self, action: #selector(self.checkValidMeal), forControlEvents: .EditingChanged)

        checkValidMeal()
    }
    
    func checkValidMeal(){
        if titleTextField.text!.isEmpty || descTextField.text!.isEmpty{
            submitButton.enabled = false
            return
        }
        submitButton.enabled = true
    }
    
    @IBAction func finishiButtonPressed(sender: UIButton){
        let title = titleTextField.text
        let desc = descTextField.text
        
        let appDelegete = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegete.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Meal", inManagedObjectContext: manageContext)
        
        let meal = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
        
        meal.setValue(title, forKey: Meal.Fields.Title)
        meal.setValue(desc, forKey: Meal.Fields.Desc)
        meal.setValue(0, forKey: Meal.Fields.Score)
        do{
            try manageContext.save()
        }catch let error as NSError{
            print(error)
        }
        
        navigationController?.popViewControllerAnimated(true)
    }
    
}
