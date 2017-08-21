//
//  ResultViewController.swift
//  Roshambo
//
//  Created by sam on 7/21/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var informResult: UITextField!
    
    @IBOutlet weak var human: UIImageView!
    @IBOutlet weak var computer: UIImageView!
    @IBOutlet weak var result: UIImageView!
    
    
    var humanHas : String! // ImplicitlyUnwrappedOptional<String>
    var computerHas : String!
    var winOrLost : String!
//    var resultDictionary = [String:String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("resultVC viewDidLoad got called and the humanHas is type of ", type(of: humanHas))

        // Do any additional setup after loading the view.
        
        
//        print ("in resultVC : ", humanHas!,computerHas!)
        
//        human.contentMode = .scaleAspectFit
//        computer.contentMode = .scaleAspectFill
        
//        if humanHas == "rock" {
//            switch computerHas! {
//            case "scissor":
//                winOrLost = "won"
//            case "rock":
//                winOrLost = "draw"
//            default:
//                winOrLost = "lost"
//            }
//        }
//
//        if humanHas == "paper" {
//            switch computerHas! {
//            case "rock":
//                winOrLost = "won"
//            case "paper":
//                winOrLost = "draw"
//            default:
//                winOrLost = "lost"
//            }
//        }
//        
//        if humanHas == "scissor" {
//            switch computerHas! {
//            case "paper":
//                winOrLost = "won"
//            case "scissor":
//                winOrLost = "draw"
//            default:
//                winOrLost = "lost"
//            }
//        }
        let humancomputer = humanHas!+computerHas!

        if humanHas == computerHas {
            winOrLost = "draw"
        } else {
            switch humancomputer {
            case "rockscissor","paperrock","scissorpaper" :
                winOrLost = "won"
            default:
                winOrLost = "lost"
            }
        }

        
        // Update the TextField and three images
        informResult.text = winOrLost
        informResult.isEnabled = false
        human.image = UIImage(named: humanHas!)
        computer.image = UIImage(named: computerHas!)
        result.image = UIImage(named: winOrLost!)
        
        // MARK: Build dictionary and store it to array in History.swift
        
        resultDictionary = ["Human":humanHas , "Computer":computerHas ,"Result":winOrLost]
        resultArray.append(resultDictionary)
//        print("         \(resultArray.count) the result array is : \(resultArray)", type(of: resultDictionary))
        

    }

    
    @IBAction func dismiss(_ sender: Any) {
        print("IBAction Dismiss got called in ResultVC")
//        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
