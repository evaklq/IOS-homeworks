//
//  ViewController.swift
//  Hw2
//
//  Created by Mac on 2023-07-01.
//

import UIKit

class AddNewContactViewController: UIViewController {
    @IBOutlet weak var writeNumberLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var writePasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var writeNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    weak var delegate: ContactsViewControllerDelegate?
    private var photos: [UIImage?] = [
        UIImage(named: "sadStupidCat"),
        UIImage(named: "girlWednesdayCat"),
        UIImage(named: "funnyMan"),
        UIImage(named: "breathtaking"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonCheckPhoneAndPassword(_ sender: Any) {
        guard (storyboard?.instantiateViewController(withIdentifier: "ContactsViewController")) != nil else { return }
        
        guard let mistakeViewController = storyboard?.instantiateViewController(withIdentifier: "MistakeViewController") as? MistakeViewController else { return }
        mistakeViewController.view.backgroundColor = .lightGray
        

        //проверки на пустоту полей, вводимых юзером
        guard let number = numberTextField.text, !number.isEmpty else {
            present(mistakeViewController, animated: true)
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            present(mistakeViewController, animated: true)
            return
        }
        guard let name = nameTextField.text, !name.isEmpty else {
            present(mistakeViewController, animated: true)
            return
        }
        guard let photo = photos.randomElement(), photo != nil else { return }
        
        // проверка на правильность и добавление в лист контактов полей, вводимых юзером
        if checkNumber(number: number) && password == "evaklq" {
            delegate?.update(newContact: ContactsListTableViewData(name: name, photo: photo, number: number))
            
            navigationController?.popViewController(animated: true)
            
        } else {present(mistakeViewController, animated: true)}
        
        numberTextField.text = nil
        passwordTextField.text = nil
        nameTextField.text = nil
    }
    
    private func checkNumber(number: String) -> Bool {
        if number.hasPrefix("8908") {return true}
        else {return false}
    }
}


