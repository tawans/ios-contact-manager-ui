import UIKit

enum CustomString: CustomStringConvertible {

    case nameText
    case ageText
    case phoneNumberText
    case cellNameText
    case wrongNameMessage
    case wrongAgeMessage
    case wrongPhoneNumberMessage
    case cancelMessage
    case detailTitleText
    case contactListTitleText
    case fatalErrorText
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
        case .cellNameText:
            return "contactCell"
        case .wrongNameMessage:
            return "입력한 이름 정보가 잘못되었습니다."
        case .wrongAgeMessage:
            return "입력한 나이정보가 잘못되었습니다."
        case .wrongPhoneNumberMessage:
            return "입력한 연락처 정보가 잘못되었습니다."
        case .cancelMessage:
            return "정말 종료하시겠습니까?"
        case .detailTitleText:
            return "새 연락처"
        case .contactListTitleText:
            return "연락처"
        case .fatalErrorText:
            return "init(coder:) has not been implemented"
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
