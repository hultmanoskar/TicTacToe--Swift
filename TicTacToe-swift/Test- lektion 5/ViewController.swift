//
//  ViewController.swift
//  Test- lektion 5
//
//  Created by Oskar Hultman on 2022-09-13.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backgroundGradientView: UIView!
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var player2txf: UITextField!
    @IBOutlet weak var player1txf: UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
           //Gradient background
           let gradientLayer = CAGradientLayer()
           gradientLayer.frame = view.bounds
           gradientLayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 130/255, green: 40/255, blue: 40/255, alpha: 80).cgColor]
           gradientLayer.shouldRasterize = true
           backgroundGradientView.layer.addSublayer(gradientLayer)
       }

       override var shouldAutorotate: Bool {
           return false
       }
       
    @IBAction func onClick(_ sender: UIButton) {
        print("Navigates to game")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? GameViewController {
            
            controller.playerName1 = player1txf.text
            controller.playerName2 = player2txf.text
        }
    }
}
        
     


    
    


