//
//  MemoryModel.swift
//  Memorize
//
//  Created by ammar on 13/05/2023.
//

import Foundation
struct MemoryModel<CardContent> where CardContent:Equatable{
    
    private(set) var  cards : [Card]
    private var indexOfFistChoseeCard:Int?
    
    init(numberOfPair :Int,getContent:(Int)->CardContent) {
        cards=[]
        for num in 0...numberOfPair{
            cards.append(Card(id: num*2, content: getContent(num)))
            cards.append(Card(id: num*2+1, content: getContent(num)))
        }
    }
    mutating func chosee(_ card:Card){
        if let chosenIndex = cards.firstIndex(where: { c in c.id == card.id }),!card.isMatch,!card.isCLicked{
            if let x = indexOfFistChoseeCard{
                if cards[chosenIndex].content == cards[x].content {
                    cards[chosenIndex].isMatch=true
                    cards[x].isMatch=true
                }
                indexOfFistChoseeCard = nil
            }
            else {
                for index in cards.indices{
                    cards[index].isCLicked = false
                }
                indexOfFistChoseeCard = chosenIndex
            }
            
            cards[chosenIndex].isCLicked.toggle()
            
        }
        
    }
    
    func getIndex(of card:Card)->Int{
        var indexOfCard=0
        for index in 0...(cards.count-1){
            if (cards[index].id == card.id ){
                indexOfCard=index
                
            }
        }
        return indexOfCard
    }
    struct Card: Identifiable{
        var id:Int
        var content:CardContent
        init(id:Int,content:CardContent) {
            self.id = id
            self.content=content
        }
        var isCLicked:Bool=false
        var isMatch=false
    }
    
    
    
}
