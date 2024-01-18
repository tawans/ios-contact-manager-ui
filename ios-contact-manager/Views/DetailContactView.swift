import UIKit

final class DetailContactView: UIView {
    
    private var nameLabel: UILabel
    private var ageLabel: UILabel
    private var phoneNumberLabel: UILabel
    
    var nameTextField: UITextField
    var ageTextField: UITextField
    var phoneNumberTextField: UITextField
    
    var nameTextFieldView: UIStackView
    var ageTextFieldView: UIStackView
    var phoneNumberTextFieldView: UIStackView
    
    private var stackView: UIStackView
    
    override init(frame: CGRect) {

        nameLabel = UILabel()
        ageLabel = UILabel()
        phoneNumberLabel = UILabel()

        nameTextField = UITextField()
        ageTextField = UITextField()
        phoneNumberTextField = UITextField()
        
        nameTextFieldView = UIStackView()
        ageTextFieldView = UIStackView()
        phoneNumberTextFieldView = UIStackView()
        stackView = UIStackView()
        
        super.init(frame: frame)
        
        setupLabel()
        setupTextField()
        setupTextFieldView()
        setupStackView()
        
        setupUI()
        setupSubView()
        setupKeyboard()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(CustomViewControllerString.fatalErrorText.description)
    }
}
// MARK: Methed
extension DetailContactView {
    
    private func setupLabel() {
        nameLabel = configureLabel(with: CustomValidString.nameText.description)
        ageLabel = configureLabel(with: CustomValidString.ageText.description)
        phoneNumberLabel = configureLabel(with: CustomValidString.phoneNumberText.description)
    }
    
    private func configureLabel(with text: String) -> UILabel {
        let label: UILabel = UILabel()
        label.text = text
        label.textAlignment = .center
        return label
    }
    
    private func setupTextField() {
        nameTextField = configureTextField()
        ageTextField = configureTextField()
        phoneNumberTextField = configureTextField()
    }
    
    private func configureTextField() -> UITextField {
        let textField: UITextField = UITextField()
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
    }
    
    private func setupTextFieldView() {
        nameTextFieldView = configureTextFieldView(with: nameLabel, textField: nameTextField)
        ageTextFieldView = configureTextFieldView(with: ageLabel, textField: ageTextField)
        phoneNumberTextFieldView = configureTextFieldView(with: phoneNumberLabel, textField: phoneNumberTextField)
    }
    
    private func configureTextFieldView(with label: UILabel, textField: UITextField) -> UIStackView {
        let stack: UIStackView = UIStackView(arrangedSubviews: [label, textField])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 14
        
        if label == nameLabel {
            nameTextFieldView = stack
        } else if label == ageLabel {
            ageTextFieldView = stack
        } else if label == phoneNumberLabel {
            phoneNumberTextFieldView = stack
        }
        
        return stack
    }
    
    private func setupStackView() {
        stackView = configureStackView()
    }
    
    private func configureStackView() -> UIStackView {
        let stack: UIStackView = UIStackView(arrangedSubviews: [nameTextFieldView, ageTextFieldView, phoneNumberTextFieldView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 14
        return stack
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
    
    private func setupCustomAutoresizing() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        let widthSize: CGFloat = 60
        let heightSize: CGFloat = 34
        
        let sidePaddingSize: CGFloat = 14
        let topPaddingSize: CGFloat = 20
        
        nameLabel.widthAnchor.constraint(equalToConstant: widthSize).isActive = true
        nameTextFieldView.heightAnchor.constraint(equalToConstant: heightSize).isActive = true
        
        ageLabel.widthAnchor.constraint(equalToConstant: widthSize).isActive = true
        ageTextFieldView.heightAnchor.constraint(equalToConstant: heightSize).isActive = true
        
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: widthSize).isActive = true
        phoneNumberTextFieldView.heightAnchor.constraint(equalToConstant: heightSize).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: sidePaddingSize).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -sidePaddingSize).isActive = true
        stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: topPaddingSize).isActive = true
    }
    
    @objc
    private func phoneNumberEditingChanged(_ textField: UITextField) {
        textField.text = textField.text?.formatPhoneNumber()
    }
}
