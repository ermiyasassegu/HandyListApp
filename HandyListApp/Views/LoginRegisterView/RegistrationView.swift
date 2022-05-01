//
//  RegistrationView.swift
//  HandyListApp
//
//  Created by iosdev on 12.4.2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentionMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            //header view
           AuthHeaderView(title1: "GetStarted", title2: "CreateAccount")

            VStack(spacing: 40){
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "UserName",
                                 text: $username)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "FullName",
                                 text: $fullname)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecuredField: true,
                                 text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)
            } label: {
                Text(LocalizedStringKey("SignUp"))
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button{
                presentionMode.wrappedValue.dismiss()
                
            } label: {
                HStack{
                    Text(LocalizedStringKey("hasAccount"))
                    .font(.footnote)
                    
                Text(LocalizedStringKey("SignIn"))
                    .font(.footnote)
                    .fontWeight(.semibold)
                
               }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
