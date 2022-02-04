//
//  ContentView.swift
//  Test Project
//
//  Created by Wellington Jiang on 9/20/21.
//

import SwiftUI

class darkMode: ObservableObject {
    @Published var on: Bool = true
}

struct ContentView: View {
    @State private var selection: Tab = .grid
    @StateObject var dark = darkMode()
    
    enum Tab {
        case grid
        case list
    }
    
    var body: some View {
        TabView (selection: $selection){
            LandmarkCols()
                .environmentObject(dark)
                .tabItem {
                    Label("Grid", systemImage: "star")
                }
                .tag(Tab.grid)
                .onAppear() {
                    UITabBar.appearance().barTintColor = .white
                }
            LandmarkList()
                .environmentObject(dark)
                .tabItem {
                    Label("List", systemImage: "list.bullet")

                }
                .tag(Tab.list)
                .onAppear() {
                    UITabBar.appearance().barTintColor = .white
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
