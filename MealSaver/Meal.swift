//
//  Meal.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/17/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit

internal class Meal {
    //MARK: Properties
    private var _title: String
    private var _desc: String
    private var _score: Float
    
    struct Fields{
        static let Title = "title"
        static let Desc = "desc"
        static let Score = "score"
    }
    
    //MARK: computed properties
    var title: String{
        get{
            return _title
        }
    }
    var desc: String{
        get{
            return _desc
        }
    }
    var score: Float{
        get{
            return _score
        }
    }
    
    //MARK: initializers
    init?(title: String, description: String, score: Float){
        self._title = title
        self._desc = description
        self._score = score
        
        if title.isEmpty  || description.isEmpty || score > 5 || score < 0{
            return nil
        }
    }
}
