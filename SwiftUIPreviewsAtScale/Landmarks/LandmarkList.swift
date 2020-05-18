/*
 Copyright © 2020 Apple Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        let twoRows = UserData()
        twoRows.landmarks = [.fixture(name: "Turtle Rock", imageName: "turtlerock", isFavorite: true)]

        let longList = UserData()
        longList.landmarks = Array(repeating: .fixture(name: "A"), count: 100)

        let longName = UserData()
        longName.landmarks = [.fixture(name: String(repeating: "A", count: 200))]

        let favorites = UserData()
        favorites.landmarks = [
            .fixture(id: 1, name: "A", isFavorite: true),
            .fixture(id: 2, name: "B", isFavorite: false)
        ]

        return Group {
            LandmarkList()
                .environmentObject(twoRows)

            LandmarkList()
                .environmentObject(longList)

            LandmarkList()
                .environmentObject(longName)

            LandmarkList()
                .environmentObject(favorites)
        }.previewDevice("iPhone SE")
    }
}
