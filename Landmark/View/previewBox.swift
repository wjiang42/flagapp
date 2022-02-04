//
//  previewBox.swift
//  Landmark
//
//  Created by Wellington Jiang on 11/18/21.
//

import SwiftUI

struct previewBox: View {
    var previewImage: Image
    
    var body: some View {
        previewImage
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 140, alignment: .center)
            .clipped()
        
    }
}

struct previewBox_Previews: PreviewProvider {
    static var previews: some View {
        previewBox(previewImage: Image("Image"))
    }
}
