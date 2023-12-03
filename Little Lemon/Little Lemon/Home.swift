//
//  Home.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/3/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Text("Menu")
                .tabItem(
                    {
                        Label("Menu", systemImage: "list.dash")
                    }
                )
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
