import UIKit

enum CustomValidString: CustomStringConvertible {

    case nameText
    case ageText
    case phoneNumberText
    
    case validDictionaryNameKeyText
    case validDictionaryAgeKeyText
    case validDictionaryPhoneNumberKeyText
    
    case RegularExpressionNamePatthenText
    case RegularExpressionAgePatthenText
    case RegularExpressionPhoneNumberPatthenText
    case RegularMatchesText

    
    var description: String {
        switch self {
        case .nameText:
            return "이름"
        case .ageText:
            return "나이"
        case .phoneNumberText:
            return "연락처"
            
        case .validDictionaryNameKeyText:
            return "nameValid"
        case .validDictionaryAgeKeyText:
            return "ageValid"
        case .validDictionaryPhoneNumberKeyText:
            return "phoneNumberValid"
            
        case .RegularExpressionNamePatthenText:
            return "^[a-zA-Z가-힣]*$"
        case .RegularExpressionAgePatthenText:
            return "^[0-9]{1,3}$"
        case .RegularExpressionPhoneNumberPatthenText:
            return "^\\d{2,3}-\\d{3,4}-\\d{4}$"
        case .RegularMatchesText:
            return "SELF MATCHES %@"
        }
    }
}
