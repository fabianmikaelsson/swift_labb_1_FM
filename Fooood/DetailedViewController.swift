//
//  DetailedViewController.swift
//  Fooood
//
//  Created by Fabian Mikaelsson on 2017-03-17.
//  Copyright © 2017 Fabian Mikaelsson. All rights reserved.
//

import UIKit

class DetailedViewController : UIViewController {
    
    @IBOutlet weak var kcalLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var kcalBLabel: UILabel!
    @IBOutlet weak var proteinBLabel: UILabel!
    @IBOutlet weak var carbsBLabel: UILabel!
    @IBOutlet weak var fatBLabel: UILabel!
    
    @IBAction func tapToGoBack(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    var name : String?
    var id : Int = 0
    var kcal : Int = 0
    var carbs : Double = 0
    var protein : Double = 0
    var fat : Double = 0
    var healthyValue : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValues()
    }
    
    func updateValues() {
        kcalLabel.text = String(kcal)
        proteinLabel.text = String(protein) + "g"
        scoreLabel.text = String(Int(healthyValue))
        kcalBLabel.text = String(kcal)
        proteinBLabel.text = String(protein) + "g"
        carbsBLabel.text = String(carbs) + "g"
        fatBLabel.text = String(fat) + "g"
    }
    
}
