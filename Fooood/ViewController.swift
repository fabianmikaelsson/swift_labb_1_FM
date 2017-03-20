//
//  ViewController.swift
//  Fooood
//
//  Created by Fabian Mikaelsson on 2017-03-03.
//  Copyright © 2017 Fabian Mikaelsson. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userDidEnterData(data: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var searchFood: UITextField!
    @IBOutlet weak var verticalSpacingConstraint: NSLayoutConstraint!
    
    
    
    
    var searchResult : [Food] = []
    var searchTerm: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController : TableFoodViewController = segue.destination as! TableFoodViewController
            
        destViewController.searchTerm = searchFood.text!
    }

    
    
    
    func startAnimation() {
        verticalSpacingConstraint.constant = 0
        UIView.animate(withDuration: 1.0, delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func showButton(_ sender: UIButton) {
        
    }
    
    
}
























