//
//  File.swift
//  Little Lemon
//
//  Created by Vortana Say on 1/1/24.
//

import SwiftUI

struct AppFontTemplate {
    static func get(font: AppFonts) -> FontTemplate {
        switch font {
        case .displayTitle:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium, 
                                foregroundColor: .primary2)
        case .subTitle:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextRegular.rawValue, size: 40.0),
                                weight: .regular,
                                foregroundColor: .secondary3)
        case .leadText:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 18.0),
                                weight: .medium,
                                foregroundColor: .secondary3)
        case .sectionTitle:
            return FontTemplate(font: Font.custom(AppFont.karlaBold.rawValue, size: 20),
                                weight: .bold,
                                foregroundColor: .black)
        case .sectionCategory:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        case .cardTitle:
            return FontTemplate(font: Font.custom(AppFont.karlaBold.rawValue, size: 16.0),
                                weight: .bold,
                                foregroundColor: .black)
        case .paragraphText:
            return FontTemplate(font: Font.custom(AppFont.karlaRegular.rawValue, size: 12.0),
                                weight: .regular,
                                foregroundColor: .black)
        case .highlightText:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        }
    }
}
