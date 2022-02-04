//
//  LandmarkRow.swift
//  Test Project
//
//  Created by Wellington Jiang on 10/4/21.
//

import SwiftUI

struct LandmarkRow: View {
    @EnvironmentObject var dark: darkMode
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width:40, height:30)
            Text(landmark.name)
                .foregroundColor(dark.on ? Color.black: Color.white)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName:"star.fill")
                    .foregroundColor(.gray)
            }
        }
        .listRowBackground(Color.black)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0]).environmentObject(darkMode())
        }
    }
}
