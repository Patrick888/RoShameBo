//
//  DetailResultViewController.swift
//  Roshambo
//
//  Created by sam on 8/19/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation

import UIKit

class DetailResultViewController : UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    
    var result:String!
    var text:String!
    
    override func viewWillAppear(_ animated: Bool) {
//        print("hi viewDidLoad in detailVC")
        detailImage.image=UIImage(named: result)
        detailTextView.text=text
    }

}

