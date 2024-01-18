import UIKit

final class DetailContactViewController: UIViewController {
    
    private let contactManager: ContactManager = ContactManager.shared
    private let detailView: DetailContactView = DetailContactView()
    private let reloadDataClosure: (() -> Void)

    private lazy var saveButton: UIBarButtonItem = {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        return button
    }()
    
    private lazy var cancelButton: UIBarButtonItem = {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        return button
    }()
    
    init(reloadDataClosure: @escaping (() -> Void)) {
        self.reloadDataClosure = reloadDataClosure
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(CustomViewControllerString.fatalErrorText.description)
    }
}

// MARK: Lifecycle
extension DetailContactViewController {
    override func loadView() {
        super.loadView()
        view = detailView
        setupNavigator()
    }
}

// MARK: Method
extension DetailContactViewController {
    
    private func setupNavigator() {
        let navigationBarAppearance: UINavigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        title = CustomViewControllerString.detailTitleText.description
        navigationItem.rightBarButtonItem = self.saveButton
        navigationItem.leftBarButtonItem = self.cancelButton
    }

    @objc
    private func saveButtonTapped() {
        let name: String = detailView.nameTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""
        let age: String = detailView.ageTextField.text ?? ""
        let phoneNumber: String = detailView.phoneNumberTextField.text ?? ""
        
        let okAction = UIAlertAction(title: CustomAlertString.alertActionOkText.description, style: .default)
        
        let isTextFieldValidResultDictionary = isTextFieldValid(name: name, age: age, phoneNumber: phoneNumber)
        checkNameTextFieldIsEmpty(name: name) ? showMessageAlertWithActions(inputMessage: CustomAlertString.isEmptyNameAlertMessage.description, actionList: [okAction]) : isValidCheckAndShowAlert(inputValidDictionary: isTextFieldValidResultDictionary,contactInfoName: name, contactInfoAge: Int(age) ?? 0, contactInfoPhoneNumber: phoneNumber)
    }
    
    @objc
    private func cancelButtonTapped() {
        let noAction = UIAlertAction(title: CustomAlertString.alertActionNoText.description, style: .default)
        let yesAction = UIAlertAction(title: CustomAlertString.alertActionYesText.description, style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        showMessageAlertWithActions(inputMessage: CustomAlertString.cancelAlertMessage.description, actionList: [yesAction, noAction])
    }
    
    private func showMessageAlertWithActions(inputMessage: String, actionList: [UIAlertAction]) {
        self.showMessageAlert(message: inputMessage, action: actionList)
    }
    
    private func checkNameTextFieldIsEmpty(name: String) -> Bool {
        return name == "" ? true : false
    }
    
    private func isTextFieldValid(name: String, age: String, phoneNumber: String) -> [String:Bool] {
        let namePattern: String = CustomValidString.RegularExpressionNamePatthenText.description
        let agePattern: String = CustomValidString.RegularExpressionAgePatthenText.description
        let phoneNumberPattern: String = CustomValidString.RegularExpressionPhoneNumberPatthenText.description
        
        let isNameValidResult: Bool = NSPredicate(format: CustomValidString.RegularMatchesText.description, namePattern).evaluate(with: name)
        let isAgeValidResult: Bool = NSPredicate(format: CustomValidString.RegularMatchesText.description, agePattern).evaluate(with: age)
        let isPhoneNumberValidResult: Bool = NSPredicate(format: CustomValidString.RegularMatchesText.description, phoneNumberPattern).evaluate(with: phoneNumber)
        
        return [CustomValidString.validDictionaryNameKeyText.description: isNameValidResult,
                CustomValidString.validDictionaryAgeKeyText.description: isAgeValidResult,
                CustomValidString.validDictionaryPhoneNumberKeyText.description: isPhoneNumberValidResult]
    }
    
    private func isValidCheckAndShowAlert(inputValidDictionary: [String: Bool], contactInfoName: String, contactInfoAge: Int, contactInfoPhoneNumber: String) {
        let resultAction = UIAlertAction(title: CustomAlertString.alertActionOkText.description, style: .default)
        
        if let isNameValid = inputValidDictionary[CustomValidString.validDictionaryNameKeyText.description], !isNameValid {
            showMessageAlertWithActions(inputMessage: CustomAlertString.wrongNameAlertMessage.description, actionList: [resultAction] )
        } else if let isAgeValid = inputValidDictionary[CustomValidString.validDictionaryAgeKeyText.description], !isAgeValid {
            showMessageAlertWithActions(inputMessage: CustomAlertString.wrongAgeAlertMessage.description, actionList: [resultAction])
        } else if let isPhoneNumberValid = inputValidDictionary[CustomValidString.validDictionaryPhoneNumberKeyText.description], !isPhoneNumberValid {
            showMessageAlertWithActions(inputMessage: CustomAlertString.wrongPhoneNumberAlertMessage.description, actionList: [resultAction])
        } else {
            contactManager.createContact(name: contactInfoName, age: contactInfoAge, number: contactInfoPhoneNumber)
            return self.dismiss(animated: true) { [weak self] in
                self?.reloadDataClosure()
            }
        }
    }
}

