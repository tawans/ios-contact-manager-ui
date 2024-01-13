import UIKit

class ContactListViewController: UIViewController {
    
    var contactManager = ContactManager.shared
    var contactListView: ContactListView = ContactListView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(CustomString.fatalErrorText.description)
    }
    
    override func loadView() {
        view = contactListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactListView.tableView.dataSource = self
    }
    
}

extension ContactListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager.readContact().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomString.cellNameText.description, for: indexPath)
        let contactData = contactManager.readContact()
        let contact = contactData[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(contact.name) (\(contact.age))"
        content.secondaryText = contact.phoneNumber
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
}