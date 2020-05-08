//
//  ContentView.swift
//  ScalingSwiftUIPreviews
//
//  Created by Vadim Bulavin on 5/7/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LocalePreview {
            Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
