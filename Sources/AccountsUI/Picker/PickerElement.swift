//
//  PickerElement.swift
//
//
//  Created by Bastián Véliz Vega on 12-09-20.
//

import Foundation

/// Picker element
public struct PickerElement<T>: Identifiable {
    /// Picker id. Is also use as index in a array of elements
    public let id: Int

    /// Element used as picker source
    public let element: T

    /// Default initializer
    /// - Parameters:
    ///   - id: element identifier
    ///   - element: element used as picker source
    public init(id: Int, element: T) {
        self.id = id
        self.element = element
    }
}
