//
//  Image+MacOS.swift
//
//
//  Created by Bastián Véliz Vega on 16-09-20.
//

import SwiftUI

public extension Image {
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
