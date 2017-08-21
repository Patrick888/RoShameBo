//
//  HistoryCollectionViewController.swift
//  Roshambo
//
//  Created by sam on 8/20/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import Foundation
import UIKit

class HistoryCollectionViewController : UICollectionViewController {
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBarController?.tabBar.isHidden = false
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyCollectionCell", for: indexPath) as! HistoryCollectionViewCell
        let rowDictionary = resultArray[indexPath.row]
        let detailText = " \(rowDictionary["Human"]!) vs \(rowDictionary["Computer"]!) "
        
        cell.cellImage.image = UIImage(named: rowDictionary["Result"]!)
        cell.cellLabel.text = detailText
        //        cell.textLabel?.text = String(describing: rowDictionary)
        //        let testreult = String(describing: rowDictionary)
        print("Collection View cellForItemAt got called, the rowDictionary is \(rowDictionary) ")
        
        // Configure the cell...
        
        return cell

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let rowDictionary = resultArray[indexPath.row]
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailResult") as! DetailResultViewController
        // instantiateViewController instantiate and return an VC matching to "withIdentifier". since it return an UIViewController, downcast to the subClass DetailResultViewController
        detailViewController.result = rowDictionary["Result"]
        detailViewController.text = rowDictionary["Result"]!
        
        navigationController?.pushViewController(detailViewController, animated: true)

    }

    
}
