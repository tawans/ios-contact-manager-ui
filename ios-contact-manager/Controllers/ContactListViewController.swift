import UIKit

class ContactListViewController: UIViewController {
    
    let contactManager = ContactManager.shared
    let contactListView: ContactListView = ContactListView()
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(naviTapped))
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(CustomString.fatalErrorText.description)
    }
}

extension ContactListViewController {
    
    override func loadView() {
        view = contactListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactListView.tableView.dataSource = self
        setupNavigator()
    }
}

extension ContactListViewController {
    
    func setupNavigator() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = .blue

        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance

        navigationController?.setNeedsStatusBarAppearanceUpdate()

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        title = CustomString.contactListTitleText.description
        
        navigationItem.rightBarButtonItem = self.plusButton
    }
    
    func reloadTableView() {
        contactListView.tableView.reloadData()
    }
    
    @objc func naviTapped() {
        let detailVC = DetailContactViewController { [weak self] in
            self?.reloadTableView()
        }
        let navigationController = UINavigationController(rootViewController: detailVC)
        self.present(navigationController, animated: true)
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
        var customCell = cell.defaultContentConfiguration()
        
        customCell.text = "\(contact.name) (\(contact.age))"
        customCell.secondaryText = contact.phoneNumber
        
        cell.contentConfiguration = customCell
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
}
