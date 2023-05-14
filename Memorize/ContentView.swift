import SwiftUI

struct ContentView: View {
   @ObservedObject var gvm:GameViewModel
//    let arrEmoij=["😏","😉","😜","😄","😂","🤣","😁","😆","🥲","😀","🥹","😌","😭","😒","😩","😳"]
//    let arrAnmainls=["🐶","🦊","🐯","🐸","🐣","🐒","🦅","🐴","🦄","🦉","🐥","🐔","🐵","🦁","🐻","🐱"]
//    let arrFurits=["🍏","🍌","🍈","🥥","🫛","🫑","🧅","🥯","🍞","🥔","🌽","🥦","🍒","🥝","🍉","🍎","🍐","🍇","🍑"]
//
    
    var body: some View {
      
        VStack{
            Text("Memorize").font(.largeTitle).foregroundColor(.blue)
            
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 105)
                                           )
                ]){
                    ForEach(gvm.model.cards,id:\.id){ card in
                        Card(card: card).onTapGesture {
                            gvm.chosee(choseeCard: card)
                        }
                    }.foregroundColor(.red).padding(4.0)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                   
                        }
                    
                }
            }
            Spacer()
            HStack{
                Spacer()
                animal
                Spacer()
                face
                Spacer()
                carrot
                Spacer()
            }.padding().font(.largeTitle)
            
        }
    }
    
    var animal:some View{
        Button(action:{
            gvm.chageArray(numberOfPair: 3, typeOfArray: TypeOFArray.Animainls)
           
        }){
            VStack{
                Image(systemName: "pawprint")
                Text("animals").font(.subheadline)
            }
        }
        
    }
    var carrot:some View{
        HStack{
            Button(action:{
                gvm.chageArray(numberOfPair: 4, typeOfArray: TypeOFArray.Furits)

               
            }){
                VStack{
                    Image(systemName: "carrot")
                    Text("Fruits").font(.subheadline)
                }
                
            }
        }
    }
    var face:some View{
        HStack{
            Button(action:{
                gvm.chageArray(numberOfPair: 2, typeOfArray: TypeOFArray.Emoij)
            }){
                VStack{
                    Image(systemName: "face.smiling.inverse")
                    Text("faces").font(.subheadline)
                }
         
            }
        }
    }
}

struct Card: View {
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let gvm=GameViewModel()
        ContentView(gvm:gvm)
        
    }
}
