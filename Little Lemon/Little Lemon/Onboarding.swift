//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/3/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink (
                    destination: Home(),
                    isActive: $isLoggedIn
                ) {
                    EmptyView()
                }
                TextField(
                    "First Name",
                    text: $firstName
                )
                TextField(
                    "Last Name",
                    text: $lastName
                )
                TextField(
                    "Email",
                    text: $email
                )
                Button(
                    "Register",
                    action: {
                        if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && email.isValidEmail()) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            isLoggedIn = true
                            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        }
                    }
                )
            }
            .onAppear {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
