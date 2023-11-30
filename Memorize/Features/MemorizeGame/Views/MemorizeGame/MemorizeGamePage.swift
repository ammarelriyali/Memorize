import SwiftUI

struct MemorizeGamePage: View {
    
   @ObservedObject private var viewModel:GameViewModel
    
    init(_ gameViewModel: GameViewModel) {
        self.viewModel = gameViewModel
    }
    
    var body: some View {
        VStack{
            Text("Memorize").font(.largeTitle).foregroundColor(.blue)
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum:105))]){
                    ForEach(viewModel.model.cards,id:\.id){ card in
                        CardGameView(card: card).onTapGesture {
                            viewModel.chosee(choseeCard: card)
                        }
                    }.foregroundColor(.red).padding(4.0)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            
            Spacer(minLength: 0)
            
//            }.padding().font(.largeTitle)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MemorizeGamePage(GameViewModel())
    }
}
