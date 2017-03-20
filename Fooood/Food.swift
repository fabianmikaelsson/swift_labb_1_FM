//
//  Food.swift
//  Fooood
//
//  Created by Fabian Mikaelsson on 2017-03-03.
//  Copyright © 2017 Fabian Mikaelsson. All rights reserved.
//

import Foundation

class Food {
    
    var name : String
    var id : Int = 0
    var kcal : Int = 0
    var carbs : Double = 0
    var protein : Double = 0
    var fat : Double = 0
    var healthyValue : Double = 0
    
    
    init(name: String = "", id: Int = 0, kcal: Int = 0,protein: Double = 0.0, fat: Double = 0.0, carbs: Double = 0.0, healthiness: Double = 0.0) {
        self.name = name;
        self.id = id;
        self.kcal = kcal
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.healthyValue = ((self.protein * 10000) - (self.carbs + (self.fat * 10) * 10))
    }
}
