//
//  Landmark.swift
//  Test Project
//
//  Created by Wellington Jiang on 10/4/21.
//

import Foundation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var parent: String
    var type: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var parentName: String
    var parentImage: Image {
        Image(parentName)
    }
}
