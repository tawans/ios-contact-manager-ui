import UIKit

final class DetailContactView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = CustomString.nameText.description
        label.textAlignment = .center
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 6.0, height: 0.0))
        textField.leftViewMode = .always
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        return textField
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = CustomString.ageText.description
        label.textAlignment = .center
        return label
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 6.0, height: 0.0))
        textField.leftViewMode = .always
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        return textField
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = CustomString.phoneNumberText.description
        label.textAlignment = .center
        return label
    }()
    
    lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 6.0, height: 0.0))
        textField.leftViewMode = .always
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.clearsOnBeginEditing = false
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        textField.addTarget(self, action: #selector(phoneNumberEditingChanged(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var nameTextFieldView: UIView = {
        let view = UIView()
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        return view
    }()
    
    private lazy var ageTextFieldView: UIView = {
        let view = UIView()
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        
        return view
    }()
    
    private lazy var phoneNumberTextFieldView: UIView = {
        let view = UIView()
        view.addSubview(phoneNumberLabel)
        view.addSubview(phoneNumberTextField)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameTextFieldView, ageTextFieldView, phoneNumberTextFieldView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 14
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupSubView()
        setupKeyboard()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(CustomString.fatalErrorText.description)
    }
}

extension DetailContactView {
    
    @objc
    private func phoneNumberEditingChanged(_ textField: UITextField) {
        textField.text = textField.text?.formatPhoneNumber()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
    
    private func setupKeyboard() {
        nameTextField.keyboardType = .default
        ageTextField.keyboardType = .numberPad
        phoneNumberTextField.keyboardType = .phonePad
    }
    
    private func setupSubView() {
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.centerYAnchor.constraint(equalTo: nameTextFieldView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: nameTextField.leadingAnchor, constant: -8).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameTextFieldView.topAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameTextFieldView.bottomAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 70).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: nameTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        nameTextFieldView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        ageLabel.centerYAnchor.constraint(equalTo: ageTextFieldView.centerYAnchor).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: ageTextFieldView.leadingAnchor, constant: 8).isActive = true
        ageLabel.trailingAnchor.constraint(equalTo: ageTextField.leadingAnchor, constant: -8).isActive = true
        
        ageTextField.topAnchor.constraint(equalTo: ageTextFieldView.topAnchor).isActive = true
        ageTextField.bottomAnchor.constraint(equalTo: ageTextFieldView.bottomAnchor).isActive = true
        ageTextField.leadingAnchor.constraint(equalTo: ageTextFieldView.leadingAnchor, constant: 70).isActive = true
        ageTextField.trailingAnchor.constraint(equalTo: ageTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        ageTextFieldView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        phoneNumberLabel.centerYAnchor.constraint(equalTo: phoneNumberTextFieldView.centerYAnchor).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberTextFieldView.leadingAnchor, constant: 8).isActive = true
        phoneNumberLabel.trailingAnchor.constraint(equalTo: phoneNumberTextField.leadingAnchor, constant: -8).isActive = true
        
        phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberTextFieldView.topAnchor).isActive = true
        phoneNumberTextField.bottomAnchor.constraint(equalTo: phoneNumberTextFieldView.bottomAnchor).isActive = true
        phoneNumberTextField.leadingAnchor.constraint(equalTo: phoneNumberTextFieldView.leadingAnchor, constant: 70).isActive = true
        phoneNumberTextField.trailingAnchor.constraint(equalTo: phoneNumberTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        phoneNumberTextFieldView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 14).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -14).isActive = true
        stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
}
