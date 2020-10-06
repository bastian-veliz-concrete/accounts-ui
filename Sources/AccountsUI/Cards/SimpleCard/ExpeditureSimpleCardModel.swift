//
//  ExpeditureSimpleCardModel.swift
//
//
//  Created by Bastián Véliz Vega on 15-09-20.
//

import SwiftUI

/// Model used to populate a `ExpeditureSimpleCardView`
public struct ExpeditureSimpleCardModel: Identifiable {
    /// Expediture id
    public let id: UUID

    /// System image name (using SF Icons)
    public let systemImageName: String

    /// Tint color
    public let imageTintColor: Color

    /// Expediture name
    public let name: String

    /// Expediture amount
    public let amount: String

    /// Default initializer
    /// - Parameters:
    ///   - id: expediture id
    ///   - name: expediture name
    ///   - amount: expediture amount
    ///   - systemImageName: system image name (using SF symbols)
    ///   - imageTintColor: image tint color
    public init(id: UUID,
                name: String,
                amount: String,
                systemImageName: String,
                imageTintColor: Color) {
        self.id = id
        self.name = name
        self.amount = amount
        self.systemImageName = systemImageName
        self.imageTintColor = imageTintColor
    }
}
