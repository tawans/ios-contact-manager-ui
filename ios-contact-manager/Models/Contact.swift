//
//  Contact.swift
//  ios-contact-manager
//
//  Created by Taewan Kim on 1/3/24.
//

import UIKit

class Contact {
    
    var name: String
    var age: Int
    var phoneNumber: String

    init(name: String, age: Int, phoneNumber: String) {
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
    }
}
