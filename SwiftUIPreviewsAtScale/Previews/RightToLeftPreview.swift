//
//  RightToLeftPreview.swift
//  SwiftUIPreviewsAtScale
//
//  Created by Vadim Bulavin on 5/17/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct RightToLeftPreview<Preview: View>: View {
    private let preview: Preview

    var body: some View {
        preview
            .previewLayout(PreviewLayout.sizeThatFits)
            .environment(\.layoutDirection, .rightToLeft)
            .previewDisplayName("Right to Left")
    }

    init(@ViewBuilder builder: @escaping () -> Preview) {
        preview = builder()
    }
}
