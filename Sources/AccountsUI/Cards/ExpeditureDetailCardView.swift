//
//  ExpeditureDetailCardView.swift
//
//
//  Created by Bastián Véliz Vega on 14-09-20.
//

import SwiftUI

/**
 Expediture detail card

 This view show an expediture in detail

 - Note:
 The view shows:
     - Movement title
     - Movement description
     - Movement amount
     - Multi-payment info if exists

 - Important:
 This view is compatible with accessibility size categories
 */
public struct ExpeditureDetailCardView: View {
    @Environment(\.sizeCategory) var sizeCategory

    let model: ExpeditureDetailCardModel

    /// Default initializer
    /// - Parameter model: model with payment information
    public init(model: ExpeditureDetailCardModel) {
        self.model = model
    }

    public var body: some View {
        self.layout
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 3)
    }

    private var layout: some View {
        #if os(watchOS)
            return self.accessibilityLayout.eraseToAnyView()
        #else
            if self.sizeCategory.isAccessibility {
                return self.accessibilityLayout.eraseToAnyView()
            } else {
                return self.defaultLayout.eraseToAnyView()
            }
        #endif
    }

    // MARK: - Layout

    private var defaultLayout: some View {
        VStack {
            HStack {
                self.logo
                self.title
                self.amount
            }
            HStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 40,
                           height: 1,
                           alignment: .leading)
                self.description
                self.multiPaymentText
            }
        }
    }

    private var accessibilityLayout: some View {
        VStack(alignment: .leading) {
            self.logo
            self.title
            self.description
            self.amount
            self.multiPaymentText
        }
    }

    // MARK: - Components

    private var image: some View {
        if #available(macOS 11, iOS 13, tvOS 13, watchOS 6, *) {
            return Image(systemName: self.model.systemImageName)
                .resizable().eraseToAnyView()
        } else {
            return Rectangle().eraseToAnyView()
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

    private var title: some View {
        Text(self.model.title)
            .font(.subheadline)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .layoutPriority(1)
    }

    private var description: some View {
        Text(self.model.description)
            .font(.subheadline)
            .foregroundColor(Color.systemGray)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
            .layoutPriority(1)
    }

    private var multiPaymentText: some View {
        let paymentString = self.model.paymentInfo?.paymentString ?? ""
        let minWidth: CGFloat? = self.sizeCategory.isAccessibility ? nil : 110
        var alignment: Alignment = self.sizeCategory.isAccessibility ? .leading : .trailing

        #if os(watchOS)
            alignment = .leading
        #endif

        return Text(paymentString)
            .font(.subheadline)
            .foregroundColor(Color.red)
            .frame(minWidth: minWidth,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: alignment)
            .layoutPriority(2)
    }

    private var amount: some View {
        let minWidth: CGFloat? = self.sizeCategory.isAccessibility ? nil : 110
        var alignment: Alignment = self.sizeCategory.isAccessibility ? .leading : .trailing

        #if os(watchOS)
            alignment = .leading
        #endif

        return Text(self.model.amount)
            .font(.headline)
            .lineLimit(nil)
            .frame(minWidth: minWidth,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: alignment)
            .layoutPriority(2)
    }
}

struct ExpeditureDetailCardView_Previews: PreviewProvider {
    static let model: ExpeditureDetailCardModel = {
        let model = ExpeditureDetailCardModel(systemImageName: "creditcard.fill",
                                              imageTintColor: .indigo,
                                              title: "Esto es un texto de dos líneas blah blah blah blah",
                                              description: "Esta es una breve descripción del movimiento",
                                              amount: "$9.999.999")
        return model
    }()

    static let modelWithPayments: ExpeditureDetailCardModel = {
        let payment = ExpeditureDetailCardModel.Payments(current: 99, total: 99, title: "Cuota")
        let model = ExpeditureDetailCardModel(systemImageName: "creditcard.fill",
                                              imageTintColor: .indigo,
                                              title: "Esto es un texto de dos líneas",
                                              description: "Esta es una breve descripción del movimiento",
                                              amount: "$9.999.999",
                                              paymentInfo: payment)
        return model
    }()

    static var previews: some View {
        Group {
            ScrollView {
                ExpeditureDetailCardView(model: self.modelWithPayments)
                ExpeditureDetailCardView(model: self.model)
            }.background(Color.systemGray6)
                .environment(\.colorScheme, .light)

            ScrollView {
                ExpeditureDetailCardView(model: self.modelWithPayments)
                ExpeditureDetailCardView(model: self.model)
            }
            .environment(\.colorScheme, .dark)

            ScrollView {
                ExpeditureDetailCardView(model: self.modelWithPayments)
                ExpeditureDetailCardView(model: self.model)
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .environment(\.colorScheme, .light)

            ScrollView {
                ExpeditureDetailCardView(model: self.modelWithPayments)
                ExpeditureDetailCardView(model: self.model)
            }
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .environment(\.colorScheme, .dark)
        }
    }
}
