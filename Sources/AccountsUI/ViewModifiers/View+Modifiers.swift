//
//  View+Modifiers.swift
//
//
//  Created by Bastián Véliz Vega on 02-10-20.
//

import SwiftUI

public extension View {
    /// Update navigation bar color
    /// - Parameters:
    ///   - backgroundColor: navigation bar backgroud color
    ///   - titleColor: navigation bar tittle color
    /// - Returns: A view with navigation bar and title colors appliedI
    func navigationBarColor(_ backgroundColor: Color,
                            titleColor: Color = Color.foregroundColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}
