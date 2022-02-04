//
//  testFile.swift
//  Landmark
//
//  Created by Wellington Jiang on 11/17/21.
//

import SwiftUI

struct testFile: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("test")
                    .frame(width: 210, alignment: .leading)
                ScrollView (.horizontal) {
                    ForEach (landmarkDisplay) { landmark in
                        NavigationLink(destination: LandmarkPage(landmark: landmark)) {
                            Text(landmark.name)
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(4)
                    .background(Color.blue)
                }
            }
        }
    }
}

struct testFile_Previews: PreviewProvider {
    static var previews: some View {
        testFile()
    }
}
