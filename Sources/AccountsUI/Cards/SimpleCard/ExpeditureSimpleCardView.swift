//
//  ExpeditureSimpleCardView.swift
//
//
//  Created by Bastián Véliz Vega on 15-09-20.
//

import Foundation
import SwiftUI

/**
 Expediture simple card

 This view show an expediture category or store in a simple way

 - Note:
 The view shows:
     - Movement title
     - Movement amount

 - Important:
 This view is compatible with accessibility size categories
 */
public struct ExpeditureSimpleCardView: View {
    let model: ExpeditureSimpleCardModel
    @Environment(\.sizeCategory) var sizeCategory

    /// Default initializer
    /// - Parameter model: model with expediture information
    public init(model: ExpeditureSimpleCardModel) {
        self.model = model
    }

    /// View's body
    public var body: some View {
        self.layout
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 3)
    }

    // MARK: - Layout

    private var layout: some View {
        #if os(watchOS)
            return self.accessibilityLayout.eraseToAnyView()
        #else
            if self.sizeCategory.isAccessibility {
                return self.accessibilityLayout.eraseToAnyView()
            } else {
                return self.regularLayout.eraseToAnyView()
            }
        #endif
    }

    private var regularLayout: some View {
        HStack {
            self.logo
            self.name
            self.amount
        }
    }

    private var accessibilityLayout: some View {
        VStack(alignment: .leading) {
            self.logo
            self.name
            self.amount
        }
    }

    // MARK: - View components

    private var image: some View {
        if #available(macOS 11, iOS 13, tvOS 13, watchOS 6, *) {
            return Image(systemName: self.model.systemImageName)
                .resizable()
                .eraseToAnyView()
        } else {
            return Rectangle()
                .eraseToAnyView()
        }
    }

    private var logo: some View {
        self.image
            .scaledToFit()
            .frame(width: 40,
                   height: 30,
                   alignment: .leading)
            .foregroundColor(self.model.imageTintColor)
    }

    private var name: some View {
        Text(self.model.name)
            .font(.subheadline)
            .lineLimit(nil)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .layoutPriority(1)
    }

    private var amount: some View {
        let minWidth: CGFloat? = self.sizeCategory.isAccessibility ? nil : 110
        var alignment: Alignment = self.sizeCategory.isAccessibility ? .leading : .trailing

        #if os(watchOS)
            alignment = .leading
        #endif

        return Text(self.model.amount)
            .font(.headline)
            .frame(minWidth: minWidth,
                   alignment: alignment)
            .layoutPriority(2)
    }
}

struct ExpeditureSimpleCardView_Previews: PreviewProvider {
    static var elements: [ExpeditureSimpleCardModel] = [
        ExpeditureSimpleCardModel(name: "Alimentos", amount: "$ 9.999.999", systemImageName: "cart.fill", imageTintColor: .green),
        ExpeditureSimpleCardModel(name: "Servicios básicos blah blah blah blah blah blah blah blah blah blah", amount: "$ 999", systemImageName: "bolt.fill", imageTintColor: .yellow),
        ExpeditureSimpleCardModel(name: "Servicios online", amount: "$ 9.999.999", systemImageName: "tv.fill", imageTintColor: .blue),
        ExpeditureSimpleCardModel(name: "Otras compras", amount: "$ 9", systemImageName: "creditcard.fill", imageTintColor: .red),
    ]

    static var previews: some View {
        Group {
            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    ExpeditureSimpleCardView(model: element)
                }
            }

            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    ExpeditureSimpleCardView(model: element)
                }
            }
            .environment(\.colorScheme, .dark)

            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    ExpeditureSimpleCardView(model: element)
                }
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)

            ScrollView {
                ForEach(self.elements, id: \.id) { element in
                    ExpeditureSimpleCardView(model: element)
                }
            }
            .environment(\.sizeCategory, .accessibilityLarge)
        }
    }
}
