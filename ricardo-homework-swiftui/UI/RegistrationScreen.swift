//
//  ContentView.swift
//  ricardo-homework-swiftui
//
//  Created by Zsolt Kovacs on 24.09.22.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @StateObject var userModel = UserModel()
    
    @FocusState private var isUsernameFocused
    @State private var wasUsernameEverModified = false

    @FocusState private var isPasswordFocused
    @State private var wasPasswordEverModified = false
    
    var onRegistrationSuccessful: () -> Void

    var body: some View {
        CenteredScrollView {
            TextFieldWithError(
                title: "Username",
                text: $userModel.username,
                errorMessage: (userModel.isUsernameValid || !wasUsernameEverModified) ? nil : "Username not valid"
            )
            .focused($isUsernameFocused)
            .onChange(of: isUsernameFocused) { isFocused in
                if !isFocused {
                    wasUsernameEverModified = true
                }
            }

            TextFieldWithError(
                title: "Password",
                text: $userModel.password,
                errorMessage: (userModel.isPasswordValid || !wasPasswordEverModified) ? nil : "Password not valid"
            )
            .focused($isPasswordFocused)
            .onChange(of: isPasswordFocused) { isFocused in
                if !isFocused {
                    wasPasswordEverModified = true
                }
            }

            Spacer().frame(height: 20)

            Text(Constants.passwordRequirements)
                .font(.system(.callout))
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer().frame(height: 40)

            Button(action: registerButtonTapped) {
                Text("Register")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.orange)
                    .cornerRadius(8)
            }

            Spacer().frame(height: 100)
        }
        .padding()
    }

    private func registerButtonTapped() {
        wasUsernameEverModified = true
        wasPasswordEverModified = true
        guard userModel.isLoginDataValid else {
            return
        }
        onRegistrationSuccessful()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen(onRegistrationSuccessful: {
            print("Success")
        })
    }
}
