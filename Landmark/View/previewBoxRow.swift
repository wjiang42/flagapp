//
//  previewBoxRow.swift
//  Landmark
//
//  Created by Wellington Jiang on 11/18/21.
//

import SwiftUI

struct previewBoxRow: View {
    @EnvironmentObject private var dark: darkMode
    var landmarkDisplay: [Landmark]
    
    var body: some View {
        NavigationView {
            ZStack {
                if (dark.on == false) {
                    Color.black
                        .ignoresSafeArea()
                }
                VStack {
                    Text("See more")
                        .font(.headline)
                        .frame(width: 380, alignment: .topLeading)
                        .foregroundColor(dark.on ? Color.black: Color.white)
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(landmarkDisplay) { landmark in
                                VStack {
                                    previewBox(previewImage: landmark.image)
                                    Text(landmark.name)
                                        .frame(width: 210, alignment:.topLeading)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .opacity(0.4)
                                        .offset(y:-20)
                                        .padding(.bottom, -20)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct previewBoxRow_Previews: PreviewProvider {
    static var previews: some View {
        previewBoxRow(landmarkDisplay: landmarkDisplay).environmentObject(darkMode())
    }
}
