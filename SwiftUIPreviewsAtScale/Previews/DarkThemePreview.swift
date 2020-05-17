//
//  DarkThemePreview.swift
//  SwiftUIPreviewsAtScale
//
//  Created by Vadim Bulavin on 5/17/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct DarkThemePreview<Preview: View>: View {
    private let preview: Preview

    var body: some View {
        preview
            .previewLayout(PreviewLayout.sizeThatFits)
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark Theme")
    }

    init(@ViewBuilder builder: @escaping () -> Preview) {
        preview = builder()
    }
}
