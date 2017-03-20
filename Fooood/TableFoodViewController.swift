//
//  File.swift
//  Fooood
//
//  Created by Fabian Mikaelsson on 2017-03-07.
//  Copyright © 2017 Fabian Mikaelsson. All rights reserved.
//


import UIKit

fileprivate let reuseIdentifier = "cell"

class TableFoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var foodTableView: UITableView!
    
    var currentSelection: Int = 0
    
    
    var name = ""
    var kcal = 0
    var carbs : Double = 0.0
    var fat : Double = 0.0
    var protein : Double = 0.0
    var healthiness: Double = 0.0
    
    var searchTerm: String = ""
    
    let apiHelper = ApiHelper()
    
    var rows: Int = 0
    
    let list = ["Milk", "Honey", "Meat", "Bread", "Tacos"] //Ta bort senare
    
    
    
    override func viewDidLoad() {
        
        
        
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        apiHelper.requestFood(search: searchTerm)
        
        if rows == 0 {
            sleep(1)
        }
        
        rows = apiHelper.rows
        return rows
        
    }
    
    // Keps track on what cell to use
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableFoodCellTableViewCell
        
        
        
        cell.nameOfFood.text = apiHelper.foodId[indexPath.row].name
        return cell
        
    }
    
    // Keeps track on clicked row.
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.currentSelection = indexPath.row
        // Starts detail viewcontroller
        self.performSegue(withIdentifier: "ResultsSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let destinationVC = segue.destination as! DetailedViewController
            
            apiHelper.requestNutrition(id: apiHelper.foodId[currentSelection].id)
            
            sleep(1)
            
            destinationVC.name = apiHelper.mat[0].name
            destinationVC.kcal = apiHelper.mat[0].kcal
            destinationVC.carbs = apiHelper.mat[0].carbs
            destinationVC.protein = apiHelper.mat[0].protein
            destinationVC.fat = apiHelper.mat[0].fat
            destinationVC.healthyValue = apiHelper.mat[0].healthyValue
            
        }
    }
    
}



