//
//  MealsTest.swift
//  MealSaver
//
//  Created by Diego Llamas Velasco on 7/17/16.
//  Copyright © 2016 Diego Llamas Velasco. All rights reserved.
//

import UIKit
import XCTest

class MealTest: XCTestCase {
    func testInitMeal(){
        let mealValid = Meal(title: "test meal", description: "Description", score: 4.5)
        XCTAssertNotNil(mealValid, "this sould be correct Meal object")
        
        let invalidTitle = Meal(title: "", description: "Description", score: 5)
        XCTAssertNil(invalidTitle, "Title should not be empty")
        
        let invalidDescription = Meal(title: "Title", description: "", score: 5)
        XCTAssertNil(invalidDescription, "Description should not be empty")
        
        let invalidScoreNegative = Meal(title: "title", description: "description", score: -4)
        XCTAssertNil(invalidScoreNegative, "Score can't be negative")
        
        let invalidScoreGreater = Meal(title: "title", description: "description", score: 6)
        XCTAssertNil(invalidScoreGreater, "Score can't be greater tha 5")
    }
    
    func testGetters(){
        let testString = "Test meal"
        let titleMeal = Meal(title: testString, description: "Description", score: 4.5)
        XCTAssertEqual(testString, titleMeal!.title, "should be equal title")
        
        let descMeal = Meal(title: "title", description: testString, score: 4.5)
        XCTAssertEqual(testString, descMeal!.desc, "should be equal desc")
        
        let testScore:Float = 4.5
        let scoreMeal = Meal(title: "title", description: "Description", score: testScore)
        XCTAssertEqual(testScore, scoreMeal!.score, "should be equal score")
    }
    
}
