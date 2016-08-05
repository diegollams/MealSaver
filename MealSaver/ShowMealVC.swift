//
//  ShowMealVC.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 8/4/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit

class ShowMealVC: UIViewController {
    
    var meal: Meal?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if meal != nil {
            print(meal)
            titleLabel.text = meal!.title
            descLabel.text = meal!.desc
        }
    }
}
