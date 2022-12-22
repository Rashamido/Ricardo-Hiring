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
    @State private var isUsernameValid = false

    @FocusState private var isPasswordFocused
    @State private var wasPasswordEverModified = false
    @State private var isPasswordValid = false
    
    var onRegistrationSuccessful: () -> Void

    var body: some View {
        CenteredScrollView {
            TextFieldWithError(
                title: "Username",
                text: $userModel.username,
                errorMessage: (isUsernameValid || !wasUsernameEverModified) ? nil : "Username not valid"
            )
            .focused($isUsernameFocused)
            .onChange(of: userModel.username) { username in
                isUsernameValid = userModel.isUsernameValid
            }
            .onChange(of: isUsernameFocused) { isFocused in
                if !isFocused {
                    wasUsernameEverModified = true
                }
            }

            TextFieldWithError(
                title: "Password",
                text: $userModel.password,
                errorMessage: (isPasswordValid || !wasPasswordEverModified) ? nil : "Password not valid"
            )
            .focused($isPasswordFocused)
            .onChange(of: userModel.password) { password in
                isPasswordValid = userModel.isPasswordValid
            }
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

        isUsernameValid = userModel.isUsernameValid
        isPasswordValid = userModel.isPasswordValid

        guard isUsernameValid && isPasswordValid else {
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
