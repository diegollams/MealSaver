//
//  ViewController.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/17/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var meals = [Meal]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func loadData(){
        let meal1 = Meal(title: "Pasta azul", description: "Deliciosa pasta de color azul", score: 5)
        meals.append(meal1!)
        let meal2 = Meal(title: "Pasta azul", description: "Deliciosa pasta de color azul", score: 5)
        meals.append(meal2!)
        let meal3 = Meal(title: "Pasta azul", description: "Deliciosa pasta de color azul", score: 5)
        meals.append(meal3!)
        let meal4 = Meal(title: "Pasta azul", description: "Deliciosa pasta de color azul", score: 5)
        meals.append(meal4!)
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

