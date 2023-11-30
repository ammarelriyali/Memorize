//
//  IconEmoji.swift
//  Memorize
//
//  Created by ammar on 10/07/2023.
//

import SwiftUI

struct IconEmojiView: View {
    var title : String!
    var image : String!
    var type : TypeOfContent
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

struct IconEmoji_Previews: PreviewProvider {
    static var previews: some View {
        IconEmojiView(title: "test",
                  image: "s",
                  type: .animals,
                  viewModel: GameViewModel())
    }
}
