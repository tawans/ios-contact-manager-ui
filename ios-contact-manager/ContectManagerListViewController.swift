//
//  ContectManagerListViewController.swift
//  ios-contact-manager
//
//  Created by Matthew on 1/2/24.
//

import UIKit

class ContectManagerListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contacts: [Contact] = [
        Contact(name: "Alice", age: 22, phoneNumber: "010-1234-5678"),
        Contact(name: "Bob", age: 28, phoneNumber: "010-9876-5432"),
        Contact(name: "Charlie", age: 35, phoneNumber: "010-8765-4321"),
        Contact(name: "David", age: 40, phoneNumber: "010-2345-6789"),
        Contact(name: "Eva", age: 27, phoneNumber: "010-7890-0123"),
        Contact(name: "Frank", age: 33, phoneNumber: "010-3456-7890"),
        Contact(name: "Grace", age: 25, phoneNumber: "010-6789-0123"),
        Contact(name: "Henry", age: 31, phoneNumber: "010-1234-7890"),
        Contact(name: "Ivy", age: 29, phoneNumber: "010-4560-0123"),
        Contact(name: "Jack", age: 26, phoneNumber: "010-9012-3456"),
        Contact(name: "Karen", age: 32, phoneNumber: "010-2103-4567"),
        Contact(name: "Liam", age: 23, phoneNumber: "010-5436-7890"),
        Contact(name: "Mia", age: 36, phoneNumber: "010-7890-0123"),
        Contact(name: "Nathan", age: 30, phoneNumber: "010-2345-6789"),
        Contact(name: "Olivia", age: 28, phoneNumber: "010-8901-2345"),
        Contact(name: "Peter", age: 34, phoneNumber: "010-5678-9012"),
        Contact(name: "Quinn", age: 27, phoneNumber: "010-1234-5678"),
        Contact(name: "Rachel", age: 29, phoneNumber: "010-7890-0123"),
        Contact(name: "Samuel", age: 33, phoneNumber: "010-2345-6789"),
    ]
    
    var contactListView: ContectManagerListView!
    
    override func loadView() {
        contactListView = ContectManagerListView()
        view = contactListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactListView.tableView.delegate = self
        contactListView.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(contact.name) (\(contact.age))"
        content.secondaryText = contact.phoneNumber
        cell.contentConfiguration = content
        
//        cell.textLabel?.text = "\(contact.name) (\(contact.age))"
//        cell.detailTextLabel?.text = contact.phoneNumber
//        cell.detailTextLabel?.isHidden = false
//        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
