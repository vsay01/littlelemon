//
//  FontTemplate.swift
//  Little Lemon
//
//  Created by Vortana Say on 1/1/24.
//

import Foundation
import SwiftUI

public class FontTemplate {
    private var id: UUID
    public var font: Font
    public var weight: Font.Weight
    public var foregroundColor: Color
    public var italic: Bool
    public var lineSpacing: CGFloat
    public init(font: Font,
                weight: Font.Weight,
                foregroundColor: Color,
                italic: Bool = false,
                lineSpacing: CGFloat = 10.0) {
        self.id = UUID()
        self.font = font
        self.weight = weight
        self.foregroundColor = foregroundColor
        self.italic = italic
        self.lineSpacing = lineSpacing
    }
}

struct FontTemplateModifier: ViewModifier {
    let template: FontTemplate
    init(template: FontTemplate) {
        self.template = template
    }
    func body(content: Content) -> some View {
        content
            .font(template.font
                    .weight(template.weight)
                    .italic(template.italic))
            .lineSpacing(template.lineSpacing)
            .foregroundColor(template.foregroundColor)
    }
}

extension Font {
    public func italic(_ value: Bool) -> Font {
        return value ? self.italic() : self
    }
}

enum AppFonts {
    case displayTitle, subTitle, leadText, sectionTitle, sectionCategory, cardTitle, paragraphText, highlightText
}
