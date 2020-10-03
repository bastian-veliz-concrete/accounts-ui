//
//  View+Modifiers.swift
//
//
//  Created by Bastián Véliz Vega on 02-10-20.
//

import SwiftUI

public extension View {
    func navigationBarColor(_ backgroundColor: Color,
                            titleColor: Color = Color.foregroundColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}
