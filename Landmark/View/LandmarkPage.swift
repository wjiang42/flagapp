//
//  ContentView.swift
//  Test Project
//
//  Created by Wellington Jiang on 9/20/21.
//

import SwiftUI
import UIKit

struct LandmarkPage: View {
    @EnvironmentObject var dark: darkMode
    var landmark: Landmark
    var landmarkDisplay: [Landmark] {
        landmarks.filter { landmark1 in
            landmark1.name != landmark.name
        }
    }
    
    func shareButton() {
        let items = [landmark.name+" has a cool flag!"]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
    
    var body: some View {
        ZStack {
            if (dark.on == false) {
                Color.black
                    .ignoresSafeArea()
                    .zIndex(-1)
            }
            VStack {
                CircleImage(image: landmark.image)
                VStack {
                    HStack {
                        VStack {
                            HStack {
                                Text(landmark.name)
                                    .font(.title)
                                    .frame(width: 290, alignment: .topLeading)
                                    .foregroundColor(dark.on ? Color.black : Color.white)
                                    .padding(.top, 7)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.gray)
                                
                            }
                            .padding(-4)
                            HStack {
                                FlagImage(parentImage: landmark.parentImage)
                                    .padding(.trailing, -4)
                                Text(landmark.parent)
                                    .font(.caption)
                                    .foregroundColor(dark.on ? Color.black: Color.white)
                                Spacer()
                                Text(landmark.type)
                                    .font(.caption)
                                    .foregroundColor(dark.on ? Color.black: Color.white)
                                
                            }
                            .frame(width: 330, alignment: .topLeading)
                        }
                        Divider()
                            .frame(height: 30)
                        Button(action: shareButton) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 380)
                    Divider()
                        .frame(width: 410.0)
                    ScrollView {
                        Text(landmark.description)
                            .font(.caption)
                            .padding(10)
                            .frame(width: 380, alignment: .topLeading)
                            .foregroundColor(dark.on ? Color.black: Color.white)
                    }
                    .frame(height:90)
                }
                Divider()
                    .background(Color.gray)
                Spacer()
                previewBoxRow(landmarkDisplay: landmarkDisplay)
                    .padding(.top, -110)
                    .padding(.leading, 10)
                    .zIndex(-1)
            }
            .frame(height: 710)
        }
    }
}

struct LandmarkPage_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkPage(landmark: landmarks[0]).environmentObject(darkMode())
    }
}
