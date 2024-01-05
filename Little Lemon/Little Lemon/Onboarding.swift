//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/3/23.
//

import SwiftUI

let kName = "name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State private var name = ""
    @State private var email = ""
    @State private var isLoggedIn = false
    let persistence = PersistenceController.shared
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Image(.littleLemon)
                             .resizable()
                             .frame(width: 200, height: 50, alignment: .center)
                }
                .padding(.horizontal, 12)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Little lemon")
                        .fontTemplate(.displayTitle)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Chicago")
                                .fontTemplate(.subTitle)
                            Text("We are a fmaily owned mediterranean restaurant, focused on traditional recipes served with a modern twists.")
                                .fontTemplate(.leadText)
                                .lineSpacing(0)
                        }
                        Image(.hero)
                                 .resizable()
                                 .frame(width: 150, height: 150, alignment: .bottom)
                                 .cornerRadius(25)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
                .background(Color.primary1)
                VStack(alignment:.leading) {
                    NavigationLink (
                        destination: Menu()
                            .environment(\.managedObjectContext, persistence.container.viewContext),
                        isActive: $isLoggedIn
                    ) {
                        EmptyView()
                    }
                    Text("Name *")
                        .fontTemplate(.paragraphText)
                    TextField(
                        "",
                        text: $name
                    )
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical, 8)
                    
                    Text("Email *")
                        .fontTemplate(.paragraphText)
                    TextField(
                        "",
                        text: $email
                    )
                    .textFieldStyle(.roundedBorder)
                    Button(
                        "Log in",
                        action: {
                            if (!name.isEmpty && !email.isEmpty && email.isValidEmail()) {
                                UserDefaults.standard.set(name, forKey: kName)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                isLoggedIn = true
                                UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                            }
                        }
                    )
                    .foregroundColor(Color.black)
                    .background(.primary2)
                    .cornerRadius(12)
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .padding(12)
                Spacer()
            }
            .onAppear {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Onboarding()
}
