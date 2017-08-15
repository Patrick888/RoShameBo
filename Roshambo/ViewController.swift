//
//  ViewController.swift
//  Roshambo
//
//  Created by sam on 7/21/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var humanHas : String!
    var computerHas : String?

    @IBOutlet weak var papper: UIButton!
    @IBOutlet weak var scissor: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /// buid rock 100% programmatically, first create it ! then build the target action then create transation to resultViewConller

        let rockButton = UIButton()
        rockButton.frame = CGRect(x: 175, y: 360, width: 60, height: 60)
        rockButton.setTitle("ROCK", for: .normal)
        rockButton.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(rockButton)
        rockButton.addTarget(ViewController(), action: #selector(ViewController.humanHasRock), for: .touchUpInside)
//        print("in ViewDidLoad,",type(of: ViewController()))

    }
    
    func humanHasRock() {
        humanHas = "rock"
        computerHas = randomValue()
        print("in VC, HumanHas : \(humanHas)", "; ComputerHas :", computerHas! )
        
        //invoke the resultViewController
        var nextController : ResultViewController
        nextController = storyboard?.instantiateViewController(withIdentifier: "resultView") as! ResultViewController
        nextController.computerHas = computerHas!
        nextController.humanHas = humanHas
        present(nextController, animated: true, completion: nil)
    }
    
    func randomValue() -> String {
        let value = Int(arc4random() % 3)
        let computerHas :String
        
        switch value {
        case 0 :
            computerHas = "rock"
        case 1 :
            computerHas = "paper"
        default:
            computerHas = "scissor"
        }
        return computerHas
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
        let nextController = segue.destination as! ResultViewController
        nextController.computerHas = computerHas!
        nextController.humanHas = humanHas
        }
    }
    
    @IBAction func humanHasPapper(_ sender: Any) {
        humanHas = "paper"
        computerHas = randomValue()
        print("in VC, HumanHas : \(humanHas)", "; ComputerHas :", computerHas! )

    }
    
    /// use SotryBoard to create this IBaction and Segue for scissor button
    @IBAction func humanHasSiccsor(_ sender: Any) {
        humanHas = "scissor"
        computerHas = randomValue()
        print("in VC, HumanHas : \(humanHas)", "; ComputerHas :", computerHas! )
    }
    
}

