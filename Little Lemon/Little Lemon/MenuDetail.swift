//
//  MenuDetail.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/17/23.
//

import SwiftUI

struct MenuDetail: View {
    let item: Dish

        var body: some View {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    if let url = item.image {
                        AsyncImage(url: URL(string: url)) { phase in
                            if let image = phase.image {
                                image.resizable() // Displays the loaded image.
                            } else if phase.error != nil {
                                Color.red // Indicates an error.
                            } else {
                                Color.blue // Acts as a placeholder.
                            }
                        }
                        .frame(maxHeight: 300)
                    }
                    Text("Price: $\(item.price ?? "")")
                        .padding(4)
                        .background(.black)
                        .font(.caption)
                        .foregroundStyle(.white)
                        .offset(x: -5, y: -5)
                }
                Text(item.detail ?? "")
                    .padding()
                Spacer()
            }
            .navigationTitle(item.title ?? "Little Lemon")
        }
}
