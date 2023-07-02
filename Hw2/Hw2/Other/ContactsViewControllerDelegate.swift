//
//  ContactsViewControllerDelegate.swift
//  Hw2
//
//  Created by Mac on 2023-07-02.
//

import UIKit
protocol ContactsViewControllerDelegate : AnyObject {
    func update(newContact: ContactsListTableViewData)
}
