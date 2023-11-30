//
//  CardGame.swift
//  Memorize
//
//  Created by ammar on 10/07/2023.
//

import SwiftUI

struct CardGameView: View {
    var card:MemoryModel<String>.Card
    var body: some View {
        let shape=RoundedRectangle( cornerRadius: 25)
        ZStack{
            if(card.isMatch){
                shape.opacity(0)
            }
            else if(card.isCLicked){
               
                shape.fill().foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 4 )
                
                Text(card.content)
                    .font(.largeTitle)
            }else {
                shape
                    .fill()
                
            }
            
        }
    }
}

struct CardGame_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView(card: MemoryModel<String>.Card(id: 1, content: "") )
    }
}
