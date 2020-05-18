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
