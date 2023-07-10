//
//  Type of Content.swift
//  Memorize
//
//  Created by ammar on 10/07/2023.
//

import Foundation
enum TypeOfContent{
    case emoij
    case animals
    case furits
}

extension TypeOfContent {
    var title : String {
        
        switch(self){
        case .animals:
            return "Animals"
        case .emoij:
            return "Faces"
        case .furits:
            return "Furits"
        }
    }
}
extension TypeOfContent {
    var image : String {
        
        switch(self){
        case .animals:
            return "pawprint"
        case .emoij:
            return "face.smiling"
        case .furits:
            return "carrot"
        }
    }
}


