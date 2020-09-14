//
//  Color+Custom.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import Foundation

#if !os(macOS)
    import UIKit
#else
    import AppKit
#endif
import SwiftUI

public extension Color {
    /**
     Background color

     Get the background color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemBackground)` in iOS
        - `Color.accentColor` in watchOS
        - `Color.secondary` in tvOS
        - `Color(NSColor.windowBackgroundColor)` in macOS

     */
    static let backgroundColor: Color = {
        #if os(iOS)
            return Color(UIColor.systemBackground)
        #elseif os(watchOS)
            return .accentColor
        #elseif os(tvOS)
            return .secondary
        #else
            return Color(NSColor.windowBackgroundColor)
        #endif
    }()

    /**
     Indigo color

     Indigo color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemIndigo)` in iOS and tvOS
        - `Color(red: 94 / 255, green: 92 / 255, blue: 230 / 255)` in watchOS
        - `Color(Color(NSColor.systemIndigo)` in macOS

     */
    static let indigo: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemIndigo)
        #elseif os(watchOS)
            return Color(red: 94 / 255, green: 92 / 255, blue: 230 / 255)
        #else
            return Color(NSColor.systemIndigo)
        #endif
    }()

    static let systemGray6: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemGray6)
        #elseif os(watchOS)
            return Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255)
        #else
            return Color(NSColor.systemGray6)
        #endif
    }()
}
