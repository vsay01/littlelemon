//
//  ViewExtension.swift
//  Little Lemon
//
//  Created by Vortana Say on 1/1/24.
//

import SwiftUI

extension View {
    public func fontTemplate(_ template: FontTemplate) -> some View {
        modifier(FontTemplateModifier(template: template))
    }
    
    func fontTemplate(_ template: AppFonts) -> some View {
            self.fontTemplate(AppFontTemplate.get(font: template))
        }
}
