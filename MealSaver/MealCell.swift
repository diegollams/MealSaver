//
//  MealCell.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/17/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit
import CoreData

class MealCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    
    func setMeal(meal: Meal){
        titleLabel.text = meal.title
        descriptionLabel.text = meal.desc
        scoreTextLabel.text = "\(meal.score)"
    }
    
    func setMeal(meal: NSManagedObject){
        titleLabel.text = meal.valueForKey(Meal.Fields.Title) as? String
        descriptionLabel.text = meal.valueForKey(Meal.Fields.Desc) as? String
        let score = meal.valueForKey(Meal.Fields.Score) as! Float
        scoreTextLabel.text = "\(score)"
    }
}
