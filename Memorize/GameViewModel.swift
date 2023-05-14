//
//  GameViewModel.swift
//  Memorize
//
//  Created by ammar on 13/05/2023.
//

import Foundation

enum TypeOFArray{
    case Emoij
    case Animainls
    case Furits
}
class GameViewModel : ObservableObject{
    static   let arrEmoij=["😏","😉","😜","😄","😂","🤣","😁","😆","🥲","😀","🥹","😌","😭","😒","😩","😳"]
    static   let arrAnmainls=["🐶","🦊","🐯","🐸","🐣","🐒","🦅","🐴","🦄","🦉","🐥","🐔","🐵","🦁","🐻","🐱"]
    static   let arrFurits=["🍏","🍌","🍈","🥥","🫛","🫑","🧅","🥯","🍞","🥔","🌽","🥦","🍒","🥝","🍉","🍎","🍐","🍇","🍑"]
    
    
    static func createArray(numberOfPair num :Int,typeOfArray type:TypeOFArray )->MemoryModel<String>{
        var arr:[String]=[]
        switch(type){
        case .Emoij:
            arr=arrEmoij
        case .Animainls:
            arr=arrAnmainls
        default:
            arr=arrFurits
        }
        return MemoryModel<String>(numberOfPair: num, getContent: {num in arr[num]})

    }
    
    @Published private(set) var model=createArray(numberOfPair: 2,typeOfArray:TypeOFArray.Emoij)
    
    func chageArray(numberOfPair num :Int,typeOfArray type:TypeOFArray){
        model=GameViewModel.createArray(numberOfPair: num, typeOfArray:type )
    }
    
    func getModel()->MemoryModel<String>{return model}
    
    // MARK: - Intent(s)
    func chosee(choseeCard card:MemoryModel<String>.Card){
        model.chosee(card)
    }
    
    
}
