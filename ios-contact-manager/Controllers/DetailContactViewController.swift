import UIKit

class DetailContactViewController: UIViewController {
    
    let contactManager = ContactManager.shared
    let detailView: DetailContactView = DetailContactView()
    let reloadDataClosure: (() -> Void)?

    lazy var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        return button
    }()
    
    lazy var cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        return button
    }()
    
    init(reloadDataClosure: (() -> Void)?) {
        self.reloadDataClosure = reloadDataClosure
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(CustomString.fatalErrorText.description)
    }
}

extension DetailContactViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        setupNavigator()
    }
}

extension DetailContactViewController {
    
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
        title = CustomString.detailTitleText.description
        
        navigationItem.rightBarButtonItem = self.saveButton
        navigationItem.leftBarButtonItem = self.cancelButton
    }

    @objc func saveButtonTapped() {
        let name = detailView.nameTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""
        let age = detailView.ageTextField.text ?? ""
        let phoneNumber = detailView.phoneNumberTextField.text ?? ""
        
        let namePattern = CustomString.RegularExpressionNamePatthenText.description
        let agePattern = CustomString.RegularExpressionAgePatthenText.description
        let phoneNumberPattern = CustomString.RegularExpressionPhoneNumberPatthenText.description
        
        let isNameValid = NSPredicate(format: CustomString.RegularMatchesText.description, namePattern).evaluate(with: name)
        let isAgeValid = NSPredicate(format: CustomString.RegularMatchesText.description, agePattern).evaluate(with: age)
        let isPhoneNumberValid = NSPredicate(format: CustomString.RegularMatchesText.description, phoneNumberPattern).evaluate(with: phoneNumber)
        
        if isNameValid == false {
            sendMessageAlert(message: CustomString.wrongNameMessage.description)
        } else if isAgeValid == false {
            sendMessageAlert(message: CustomString.wrongAgeMessage.description)
        } else if isPhoneNumberValid == false {
            sendMessageAlert(message: CustomString.wrongPhoneNumberMessage.description)
        } else {
            contactManager.createContact(name: name, age: Int(age) ?? 0, number: phoneNumber)
            self.dismiss(animated: true) { [weak self] in
                self?.reloadDataClosure?()
            }
        }
    }
    
    @objc func cancelButtonTapped() {
        canceledAlert(message: CustomString.cancelMessage.description) { [weak self] _ in
            self?.dismiss(animated: true)
        }
    }
}

