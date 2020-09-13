//
//  PreviewProvider+Devices.swift
//
//
//  Created by Bastián Véliz Vega on 12-09-20.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static func getPreviews<Element: View>(for devices: [PreviewDevices],
                                           content: @escaping () -> Element) -> some View {
        return ForEach(devices, id: \.self) { device in
            content()
                .previewDevice(PreviewDevice(rawValue: device.rawValue))
                .previewDisplayName(device.rawValue)
        }
    }
}

enum PreviewDevices: String {
    case iphoneSE = "iPhone SE"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    case iPadPro11Inch = "iPad Pro (11-inch)"
}
