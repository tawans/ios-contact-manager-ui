import UIKit

extension UIViewController {
    
    func sendMessageAlert(title: String? = nil,
                                   message: String,
                                   okAction: ((UIAlertAction) -> ())? = nil,
                                   completion: (() -> ())? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
    
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
    func canceledAlert(title: String? = nil,
                                message: String,
                                okAction: ((UIAlertAction) -> ())? = nil,
                                cancelAction: ((UIAlertAction) -> ())? = nil,
                                completion: (() -> ())? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .destructive, handler: okAction)
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: cancelAction)

        alertViewController.addAction(cancelAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
