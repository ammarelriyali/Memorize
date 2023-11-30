//
//  GameViewModel.swift
//  Memorize
//
//  Created by ammar on 13/05/2023.
//

import Foundation

class GameViewModel : ObservableObject{
    static   let arrEmojis=["😏","😉","😜","😄","😂","🤣","😁","😆","🥲","😀","🥹","😌","😭","😒","😩","😳"]
    static   let arrAnimals=["🐶","🦊","🐯","🐸","🐣","🐒","🦅","🐴","🦄","🦉","🐥","🐔","🐵","🦁","🐻","🐱"]
    static   let arrFruits=["🍏","🍌","🍈","🥥","🫛","🫑","🧅","🥯","🍞","🥔","🌽","🥦","🍒","🥝","🍉","🍎","🍐","🍇","🍑"]
    var arrContent = [TypeOfContent.animals, TypeOfContent.emojis, TypeOfContent.fruits]
    
    static func createArray(numberOfPair num :Int = 2,
                            typeOfArray type:TypeOfContent = .emojis) -> MemoryModel<String> {
        var arr:[String]=[]
        switch(type){
        case .emojis:
            arr=arrEmojis
        case .animals:
            arr=arrAnimals
        default:
            arr=arrFruits
        }
        return MemoryModel<String>(numberOfPair: num, getContent: {num in arr[num]})

    }
    
    @Published private(set) var model = createArray()
    
    func chageArray(numberOfPair num :Int,typeOfArray type:TypeOfContent){
        model=GameViewModel.createArray(numberOfPair: num, typeOfArray:type )
    }
    
    func getModel()->MemoryModel<String>{return model}
    
    // MARK: - Intent(s)
    func chosee(choseeCard card:MemoryModel<String>.Card){
        model.chosee(card)
    }
    
    
}
