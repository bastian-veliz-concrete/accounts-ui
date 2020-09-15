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
        - `return Color("background")` in another case

     */
    static let backgroundColor: Color = {
        #if os(iOS)
            return Color(UIColor.systemBackground)
        #else
            return Color("background", bundle: Bundle.module)
        #endif
    }()

    /**
     Indigo color

     Indigo color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemIndigo)` in iOS and tvOS
        - `Color("indigo")` in watchOS
        - `Color(Color(NSColor.systemIndigo)` in macOS

     */
    static let indigo: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemIndigo)
        #elseif os(tvOS) || os(watchOS)
            return Color("indigo", bundle: Bundle.module)
        #else
            return Color(NSColor.systemIndigo)
        #endif
    }()

    /**
     Indigo color

     Indigo color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemTeal)` in iOS and tvOS
        - `Color("teal")` in watchOS
        - `Color(Color(NSColor.systemTeal)` in macOS

     */
    static let teal: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemTeal)
        #elseif os(watchOS)
            return Color("teal", bundle: Bundle.module)
        #else
            return Color(NSColor.systemTeal)
        #endif
    }()

    /**
     System gray color

     System gray color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemGray)` in iOS and tvOS
        - `Color("gray")` in watchOS
        - `Color(Color(NSColor.systemGray)` in macOS

     */
    static let systemGray: Color = {
        #if os(iOS) || os(tvOS)
            return Color(UIColor.systemGray)
        #elseif os(watchOS)
            return Color("gray", bundle: Bundle.module)
        #else
            return Color(NSColor.systemGray)
        #endif
    }()

    /**
     System gray 2 color

     System gray 2 color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemGray2)` in iOS
        - `Color("gray2")` in another case

     */
    static let systemGray2: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray2)
        #else
            return Color("gray2", bundle: Bundle.module)
        #endif
    }()

    /**
     System gray 3 color

     System gray 3 color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemGray3)` in iOS
        - `Color("gray3")` in another case

     */
    static let systemGray3: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray3)
        #else
            return Color("gray3", bundle: Bundle.module)
        #endif
    }()

    /**
     System gray 4 color

     System gray 4 color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemGray4)` in iOS
        - `Color("gray4")` in another case

     */
    static let systemGray4: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray4)
        #else
            return Color("gray4", bundle: Bundle.module)
        #endif
    }()

    /**
     System gray 5 color

     System gray 5 color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemGray5)` in iOS
        - `Color("gray5")` in another case

     */
    static let systemGray5: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray5)
        #else
            return Color("gray5", bundle: Bundle.module)
        #endif
    }()

    /**
     System gray 6 color

     System gray 6 color for each OS

     - Important:
        This variable returns:
        - `Color(UIColor.systemGray6)` in iOS
        - `Color("gray6")` in another case

     */
    static let systemGray6: Color = {
        #if os(iOS)
            return Color(UIColor.systemGray6)
        #else
            return Color("gray6", bundle: Bundle.module)
        #endif
    }()
}
