//
//  View+PreviewPresets.swift
//  SwiftUIPreviewsAtScale
//
//  Created by Vadim Bulavin on 5/7/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

extension View {
    func previewSupportedLocales() -> some View {
        LocalePreview { self }
    }
    
    func previewDarkTheme() -> some View {
        DarkThemePreview { self }
    }
    
    func previewRightToLeft() -> some View {
        RightToLeftPreview { self }
    }
    
    func previewContentSize(_ sizeCategory: ContentSizeCategory) -> some View {
        ContentSizeCategoryPreview(sizeCategory) { self }
    }
}

extension View {
    func previewButtonPreset() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewSupportedLocales()
            content.previewRightToLeft()
            content.previewDarkTheme()
            content.previewContentSize(.extraSmall)
            content.previewContentSize(.medium)
            content.previewContentSize(.extraExtraExtraLarge)
        }
    }
}
