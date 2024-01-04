//
//  ContectManagerListViewController.swift
//  ios-contact-manager
//
//  Created by Matthew on 1/2/24.
//

import UIKit

class ContectManagerListViewController: UIViewController {
    
    var contactManager = ContactManager.shared
    
    var contactListView: ContectManagerListView!
    
    override func loadView() {
        contactListView = ContectManagerListView()
        view = contactListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactListView.tableView.dataSource = self
    }
    
}

extension ContectManagerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager.readContact().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contactData = contactManager.readContact()
        let contact = contactData[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(contact.name) (\(contact.age))"
        content.secondaryText = contact.phoneNumber
        cell.contentConfiguration = content
        
        return cell
    }
}
