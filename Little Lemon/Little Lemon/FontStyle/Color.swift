//
//  Color.swift
//  Little Lemon
//
//  Created by Vortana Say on 1/1/24.
//

import SwiftUI

extension Color {
    static let Primary = Color(Color.Key.primary.rawValue)
    static let Secondary = Color(Color.Key.secondary.rawValue)
    static let Background = Color(Color.Key.background.rawValue)
    static let Error = Color(Color.Key.error.rawValue)
    enum Key: String {
        case primary = "Primary"
        case secondary = "Secondary"
        case background = "Background"
        case error  = "Error"
    }
}
