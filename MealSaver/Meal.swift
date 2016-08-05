//
//  Meal.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/17/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit
import CoreData

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
    
    init?(nsmanageObject: NSManagedObject){
        if let title = nsmanageObject.valueForKey(Meal.Fields.Title) as? String{
            self._title = title
        }else{
            return nil
        }
        if let desc = nsmanageObject.valueForKey(Meal.Fields.Desc) as? String{
            self._desc = desc
        }else{
            return nil
        }
        if let score = nsmanageObject.valueForKey(Meal.Fields.Score) as? Float{
            self._score = score
        }else{
            return nil
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
