//
//  RegistrationView.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 12.08.22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser, label: {  })
            
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                
                Text("Get started.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Create your account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 40) {
                    CustomTextField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
                    
                    CustomTextField(imageName: "person", placeholderText: "Username", isSecureField: false, text: $username)
                    
                    CustomTextField(imageName: "person", placeholderText: "Fullname", isSecureField: false, text: $fullname)
                    
                    CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                }
                .padding([.top, .horizontal], 32)
            }
            .padding(.leading)
            
            Button {
                viewModel.register(email: email, username: username, fullname: fullname, password: password)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .padding(.top, 24)
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    
                    Text("Sign Ip")
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding(.bottom, 32)
            }
        }
        .navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
