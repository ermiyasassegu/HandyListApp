//
//  LoginPageModel.swift
//  HandyListApp
//
//  Created by iosdev on 19.4.2022.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
    // Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Registered Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var ShowReEnterPassword: Bool = false
    
    // Log status...
    @AppStorage("log_Status") var log_Status: Bool = false
    
    // Login call...
    func Login() {
        // Do action Here...
        withAnimation {
            log_Status = true
        }
    }
    
    func Register() {
        // Do action Here...
        withAnimation {
            log_Status = true
        }
    }
    
    func ForgetPassword() {
        // Do action Here...
    }
    
}

