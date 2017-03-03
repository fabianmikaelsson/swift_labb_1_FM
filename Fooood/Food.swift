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
    var value : Double
    var carbs : Double = 0
    var protein : Double = 0
    var fat : Double = 0
    var id : Int
    
    init(name: String, value: Double = 0, id: Int = 0) {
        self.name = name;
        self.value = value;
        self.id = id;
    }
    
    var score: Double {
        get {
            return (self.protein - (self.carbs + (self.fat) * 10))
        }
    }
}
