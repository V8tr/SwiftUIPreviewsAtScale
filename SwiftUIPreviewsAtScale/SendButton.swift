//
//  SendButton.swift
//  SwiftUIPreviewsAtScale
//
//  Created by Vadim Bulavin on 5/7/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct SendButton: View {
    let onAction: () -> Void = {}
    
    var body: some View {
        Button(
            action: onAction,
            label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                    Text("common.button.send")
                }
        })
    }
}

struct SendButton_Preview_Preset: PreviewProvider {
    static var previews: some View {
        SendButton()
            .previewButtonPreset()
    }
}

struct SendButton_Preview_WithoutPreset: PreviewProvider {
    static let sizeCategories: [ContentSizeCategory] = [.extraSmall, .medium, .extraExtraExtraLarge]

    static var previews: some View {
        Group {
            // Supported locales
            ForEach(Locale.all, id: \.self) { locale in
                SendButton()
                    .padding()
                    .previewLayout(PreviewLayout.sizeThatFits)
                    .environment(\.locale, locale)
                    .previewDisplayName("Locale: \(locale.identifier)")
            }

            // Dark theme
            SendButton()
                .padding()
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Theme")

            // Right to left
            SendButton()
                .padding()
                .previewLayout(PreviewLayout.sizeThatFits)
                .environment(\.layoutDirection, .rightToLeft)
                .previewDisplayName("Right to Left")

            // Content size categories
            ForEach(sizeCategories, id: \.self) { sizeCategory in
                SendButton()
                    .padding()
                    .previewLayout(PreviewLayout.sizeThatFits)
                    .environment(\.sizeCategory, sizeCategory)
                    .previewDisplayName("Content Size Category: \(sizeCategory)")
            }
        }
    }
}

