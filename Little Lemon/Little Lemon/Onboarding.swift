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

struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        VStack {
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
                    }
                }
            )
        }
    }
}

#Preview {
    Onboarding()
}
