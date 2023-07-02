//
//  MistakeViewController.swift
//  Hw2
//
//  Created by Mac on 2023-07-01.
//

import UIKit

class MistakeViewController: UIViewController {
    
    @IBOutlet weak var sadMictakeImageView: UIImageView!
    @IBOutlet weak var sadMictakeLabel: UILabel!
    @IBAction func sadMictakeTryAgainButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
