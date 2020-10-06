//
//  Image+MacOS.swift
//
//
//  Created by Bastián Véliz Vega on 16-09-20.
//

import SwiftUI

public extension Image {
    /// Get a resizable image using SF symbols
    /// - Parameter systemName: system image name
    /// - Returns: An `Image` instance
    /// - Note: In macOS 10.15 returns a `Rectangle` instance
    static func resizableImage(systemName: String) -> some View {
        #if os(macOS)
//        Uncoment when on macOS 11 release
//            if #available(macOS 11, *) {
//                return Image(systemName: systemName)
//                    .resizable()
//                    .eraseToAnyView()
//            } else {
//                return Rectangle().eraseToAnyView()
//            }

            return Rectangle().eraseToAnyView()
        #else
            return Image(systemName: systemName)
                .resizable()
                .eraseToAnyView()
        #endif
    }
}
