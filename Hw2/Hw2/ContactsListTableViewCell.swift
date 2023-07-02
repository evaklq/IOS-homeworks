//
//  ContactsListTableViewCell.swift
//  Hw2
//
//  Created by Mac on 2023-07-01.
//

import UIKit

struct ContactsListTableViewData {
    var name : String
    var photo : UIImage?
    var number : String
}

final class ContactsListTableViewCell : UITableViewCell {
    
    @IBOutlet weak var nameOfContactLabel : UILabel!
    @IBOutlet weak var photoOfContactImageView : UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameOfContactLabel.text = nil
        photoOfContactImageView.image = nil
    }
    
    func setPersonalInfo (_ data: ContactsListTableViewData) {
        nameOfContactLabel.text = data.name
        photoOfContactImageView.image = data.photo
    }
}
