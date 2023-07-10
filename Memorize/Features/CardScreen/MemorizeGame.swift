import SwiftUI

struct MemorizeGame: View {
   @ObservedObject private var viewModel:GameViewModel
    
    init(_ gvm: GameViewModel) {
        self.viewModel = gvm
    }
    
    var body: some View {
      
        VStack{
            Text("Memorize").font(.largeTitle).foregroundColor(.blue)
            
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 105)
                                           )
                ]){
                    ForEach(viewModel.model.cards,id:\.id){ card in
                        CardGame(card: card).onTapGesture {
                            viewModel.chosee(choseeCard: card)
                        }
                    }.foregroundColor(.red).padding(4.0)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                   
                        }
                }
            }
            Spacer()
            HStack{
                for i in 0...2{
                    Spacer()
                    IconEmoji(type: , viewModel: <#T##GameViewModel#>)
                }
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
            viewModel.chageArray(numberOfPair: 3, typeOfArray: TypeOFArray.Animainls)
           
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
                viewModel.chageArray(numberOfPair: 4, typeOfArray: TypeOFArray.Furits)

               
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
                viewModel.chageArray(numberOfPair: 2, typeOfArray: TypeOFArray.Emoij)
            }){
                VStack{
                    Image(systemName: "face.smiling.inverse")
                    Text("faces").font(.subheadline)
                }
         
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let gvm=GameViewModel()
        MemorizeGame(gvm)
        
    }
}
