//
//  LandmarkCols.swift
//  Landmark
//
//  Created by Wellington Jiang on 12/1/21.
//

import SwiftUI

struct LandmarkCols: View {
    @EnvironmentObject var dark: darkMode
    @State private var colour: Color = Color.black
    @State private var colour2: Color = Color.white
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                if (dark.on == false) {
                    Color.black
                        .ignoresSafeArea()
                }
                VStack {
                    Text("Flags")
                        .frame(width: 380, alignment:.topLeading)
                        .zIndex(1)
                        .font(.title .bold())
                        .foregroundColor(dark.on ? Color.black : Color.white)
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach (landmarks) { landmark in
                                NavigationLink(destination: LandmarkPage(landmark: landmark)) {
                                landmark.image
                                    .resizable()
                                    .frame(width: 195, height: 133)
                                    .padding(.bottom, -4)
                                }
                            }
                        }
                    }
                    Divider()
                        .frame(width: 360)
                        .background(dark.on ? Color.gray : Color.white)
                    Toggle (isOn: $dark.on){
                        Text("Dark Mode")
                            .foregroundColor(dark.on ? Color.black : Color.white)
                            .bold()
                            .padding(20)
                    }
                    .frame(width: 360)
                }
                .offset(y: -40)
            }
        }
    }
}

struct LandmarkCols_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkCols().environmentObject(darkMode())
    }
}
