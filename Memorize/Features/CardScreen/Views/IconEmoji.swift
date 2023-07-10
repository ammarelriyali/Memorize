//
//  IconEmoji.swift
//  Memorize
//
//  Created by ammar on 10/07/2023.
//

import SwiftUI

struct IconEmoji: View {
    var title : String!
    var image : String!
    var type : TypeOfArray
    var viewModel : GameViewModel
    
    var body: some View {
        Button(action:{
            viewModel.chageArray(numberOfPair: 3, typeOfArray: type)
           
        }){
            VStack{
                Image(systemName: image)
                Text(title).font(.subheadline)
            }
        }
    }
}
