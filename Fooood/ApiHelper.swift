//
//  apiHelper.swift
//  Fooood
//
//  Created by Fabian Mikaelsson on 2017-03-03.
//  Copyright © 2017 Fabian Mikaelsson. All rights reserved.
//

import Foundation

class ApiHelper {
    
    
    
    public var data : [Food] = []
    
    public var nutrition : [Food] = []
    
    
    public var mat : [Food] = []
    
    public var foodId : [Food] = []
    
    public var rows: Int = 0
    
    
    
    func requestFood(search: String) { //data: @escaping ([Food]) -> Void
        
        var food : [Food] = []
        
        if let url = URL(string: "http://www.matapi.se/foodstuff?query=\(search)") { //Ändra kyckling till parameter som tas in vid kallning av metod
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) {
                (maybeData: Data?, response: URLResponse?, error: Error?) in
                
                if let actualData = maybeData {
                    
                    do {
                        let jsonOptions = JSONSerialization.ReadingOptions()
                        
                        if let parsed = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String:Any]] {
                            
                                for item in parsed {
                                    let id = item["number"] as! Int
                                    let name = item["name"] as! String
                                    food.append(Food(name: name, id: id))
                                }
                                self.foodId = food
                            
                            self.rows = parsed.count
                            self.data = food
                        }
                        else
                        {
                            NSLog("Failed to cast from json.")
                        }
                    }
                    catch let parseError {
                        NSLog("Failed to parse json: \(parseError)")
                    }
                }
                else
                {
                    NSLog("No data recieved.")
                }
            }
            task.resume()
        }
        else
        {
            NSLog("Failed to create url.")
        }
    }
    
    func requestNutrition(id: Int){
        
        let urlString = "http://www.matapi.se/foodstuff/\(id)"
        if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: safeUrlString) {
            
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) {
                (maybeData: Data?, response: URLResponse?, error: Error?) in
                if let actualData = maybeData {
                    let jsonOptions = JSONSerialization.ReadingOptions()
                    do {
                        if let parsed = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [String:Any] {
                            
                                let name = parsed["name"] as! NSString
                                let item = parsed["nutrientValues"] as! [String:Any]
                                let protein = item["protein"] as! Double
                                let fat = item["fat"] as! Double
                                let carbs = item["carbohydrates"] as! Double
                                let kcal = item["energyKcal"] as! Int
                                
                                // Sparar korrekt värde!
                                self.mat.insert((Food(name: name as String, id: id, kcal: kcal, protein: protein, fat: fat, carbs: carbs, healthiness: 0.0)), at: 0)
                            
                                sleep(2)
                            
                        } else {
                            NSLog("Failed to cast from json.")
                        }
                    }
                    catch let parseError {
                        NSLog("Failed to parse json: \(parseError)")
                    }
                } else {
                    NSLog("No data received.")
                }
            }
            task.resume()
            
            
        } else {
            NSLog("Failed to create url.")
        }
    }
}
