//
//  ShowContactViewController.swift
//  Hw2
//
//  Created by Mac on 2023-07-02.
//

import UIKit

class ShowContactViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    func setPersonalInfo (name: String, number: String, photo: UIImage?) {
        numberLabel.text = number
        nameLabel.text = name
        photoImageView.image = photo
    }
}
