//
//  Type of Content.swift
//  Memorize
//
//  Created by ammar on 10/07/2023.
//

import Foundation
enum TypeOfContent{
    case emojis
    case animals
    case fruits
}

extension TypeOfContent {
    var title : String {
        
        switch(self){
        case .animals:
            return "Animals"
        case .emojis:
            return "Faces"
        case .fruits:
            return "Fruits"
        }
    }
}
extension TypeOfContent {
    var image : String {
        
        switch(self){
        case .animals:
            return "pawprint"
        case .emojis:
            return "face.smiling"
        case .fruits:
            return "carrot"
        }
    }
}
extension TypeOfContent : Identifiable{
    var id : String{
        title
    }
    
    
}


