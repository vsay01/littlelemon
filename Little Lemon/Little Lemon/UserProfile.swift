//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/3/23.
//

import SwiftUI

struct UserProfile: View {
    private let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    private let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    private let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @State var isLogoutTrigger = false
    
    @Environment(\.presentationMode) var presentation // reference the presentation environment in SwiftUI which will allow you to reach the navigation logic
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
            
            Text("First Name: \(firstName)")
            Text("Last Name: \(lastName)")
            Text("Email: \(email)")
            NavigationLink(destination: Onboarding(), isActive: $isLogoutTrigger) {
                Button("Logout") {
                    isLogoutTrigger = true
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
