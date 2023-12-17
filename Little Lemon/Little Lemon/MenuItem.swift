//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Vortana Say on 12/3/23.
//

import Foundation

struct MenuItem: Codable, Hashable {
    let id: Int
    let title: String
    let price: String
    let description: String
    let image: String
}
