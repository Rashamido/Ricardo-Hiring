//
//  UserModel.swift
//  ricardo-homework-swiftui
//
//  Created by Ryad Guerroudj on 22/12/2022.
//

import SwiftUI

class UserModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    var isUsernameValid: Bool {
        return !username.isEmpty
    }
    
    var isPasswordValid: Bool {
        return password.count >= 8 &&
        password.rangeOfCharacter(from: .letters) != nil &&
        password.rangeOfCharacter(from: .decimalDigits) != nil &&
        password.rangeOfCharacter(from: .alphanumerics.inverted) != nil
    }
    
    var isLoginDataValid: Bool {
        return isUsernameValid && isPasswordValid
    }
}
