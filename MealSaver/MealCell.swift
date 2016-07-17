//
//  MealCell.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/17/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scoreTextLabel: UILabel!
    
    func setMeal(meal: Meal){
        titleLabel.text = meal.title
        descriptionLabel.text = meal.desc
        scoreTextLabel.text = "\(meal.score)"
    }
}
