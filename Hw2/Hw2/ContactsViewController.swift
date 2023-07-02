//
//  ContactsViewController.swift
//  Hw2
//
//  Created by Mac on 2023-07-01.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var contactTableView : UITableView!
    
    @IBAction func addContactButtom(_ sender: Any) {
    }
    
    var data: [ContactsListTableViewData] = [
        ContactsListTableViewData(name: "evaklq", photo: UIImage(named: "evaklq"), number: "89082010439"),
        ContactsListTableViewData(name: "chubrik", photo: UIImage(named: "chubrik"), number: "8908556723"),
    ]
    
    // задаёт размер ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    // задаёт количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    // загружает вид странички с таблицей
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.dataSource = self
        contactTableView.delegate = self
    }
    
    // что делается при нажатии на элемент таблицы
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = data[indexPath.row].name
        let number = data[indexPath.row].number
        let photo = data[indexPath.row].photo
        
        guard let contactViewController = storyboard?.instantiateViewController(withIdentifier: "ShowContactViewController") as? ShowContactViewController else { return }
        
        contactViewController.loadViewIfNeeded()
        contactViewController.setPersonalInfo(name: name, number: number, photo: photo)
        
        navigationController?.pushViewController(contactViewController, animated: true)
    }
    
    // загружает вид таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactTableView.dequeueReusableCell(withIdentifier: "ContactsListTableViewCell") as? ContactsListTableViewCell
        else { return UITableViewCell() }
        
        cell.setPersonalInfo(data[indexPath.row])
        return cell
    }
}

extension ContactsViewController: ContactsViewControllerDelegate {
    
    // подписка на делегат
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddNewContactViewController else { return }
        destination.delegate = self
    }
    
    //функция обновления даты, при добавлении нового контакта
    func update(newContact: ContactsListTableViewData) {
        data.append(newContact)
        contactTableView.reloadData()
    }
    
}



