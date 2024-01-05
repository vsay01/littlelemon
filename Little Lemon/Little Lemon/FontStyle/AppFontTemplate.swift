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
                                foregroundColor: .black)
        case .subTitle:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        case .leadText:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        case .sectionTitle:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        case .sectionCategory:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        case .cardTitle:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        case .paragraphText:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        case .highlightText:
            return FontTemplate(font: Font.custom(AppFont.MarkaziTextMedium.rawValue, size: 64.0),
                                weight: .medium,
                                foregroundColor: .black)
        }
    }
}
