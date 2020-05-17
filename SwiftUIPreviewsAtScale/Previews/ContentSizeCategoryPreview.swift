//
//  ContentSizeCategoryPreview.swift
//  SwiftUIPreviewsAtScale
//
//  Created by Vadim Bulavin on 5/17/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct ContentSizeCategoryPreview<Preview: View>: View {
    private let preview: Preview
    private let sizeCategory: ContentSizeCategory

    var body: some View {
        preview
            .previewLayout(PreviewLayout.sizeThatFits)
            .environment(\.sizeCategory, sizeCategory)
            .previewDisplayName("Content Size Category: \(sizeCategory)")
    }

    init(_ sizeCategory: ContentSizeCategory, @ViewBuilder builder: @escaping () -> Preview) {
        self.sizeCategory = sizeCategory
        preview = builder()
    }
}
