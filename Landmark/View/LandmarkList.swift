//
//  LandmarkList.swift
//  LandmarkExample
//
//  Created by Wellington Jiang on 10/11/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var dark: darkMode
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        ZStack {
            if (dark.on == false) {
                Color.black
                    .ignoresSafeArea()
            }
            NavigationView {
                List {
                    Toggle (isOn: $showFavoritesOnly){
                        Text("Show favorites")
                            .foregroundColor(dark.on ? Color.black: Color.white)
                    }.listRowBackground(dark.on ? Color.white : Color.black)
                    
                    ForEach (filteredLandmarks) { landmark in
                        NavigationLink(destination: LandmarkPage(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }.listRowBackground(dark.on ? Color.white: Color.black)
                }.onAppear() {
                    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: dark.on ? UIColor.black: UIColor.white]
                    UITableView.appearance().backgroundColor = dark.on ? .white: .black
                }
                .padding(-10)
                .navigationTitle("Flags")
            }
            .offset(y:-20)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(darkMode())
    }
}
