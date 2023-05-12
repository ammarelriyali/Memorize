import SwiftUI

struct ContentView: View {
    let arrEmoij=["😏","😉","😜","😄","😂","🤣","😁","😆","🥲","😀","🥹","😌","😭","😒","😩","😳"]
    let arrAnmainls=["🐶","🦊","🐯","🐸","🐣","🐒","🦅","🐴","🦄","🦉","🐥","🐔","🐵","🦁","🐻","🐱"]
    let arrFurits=["🍏","🍌","🍈","🥥","🫛","🫑","🧅","🥯","🍞","🥔","🌽","🥦","🍒","🥝","🍉","🍎","🍐","🍇","🍑"]
    
    
    @State var emojConter:Int
    @State var arr:[String]
    init() {
        self.emojConter = 4
        self.arr = arrEmoij
    }
    var body: some View {
      
        VStack{
            Text("Memorize").font(.largeTitle).foregroundColor(.blue)
            
            ScrollView{
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 105)
                                           )
                ]){
                    
                    ForEach(arr[0...emojConter],id: \.self){ e in
                        Card(emoj: e)
                    }.foregroundColor(.red).padding(4.0)
                        .aspectRatio(2/3, contentMode: .fit)
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
//            if(emojConter<(arr.count-1)){
//                emojConter+=1;
//            }
            arr=arrAnmainls.shuffled()
            emojConter=6
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
//                if(emojConter > 0){
//                    emojConter-=1;
//                }
                arr=arrFurits.shuffled()
                emojConter=7
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
//                if(emojConter > 0){
//                    emojConter-=1;
//                }
                arr=arrEmoij.shuffled()
                emojConter=4
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
    let emoj:String
    @State var isClicked = true
    var body: some View {
        let shape=RoundedRectangle( cornerRadius: 25)
        ZStack{
            if(isClicked){
                shape
                    .fill()
            }else {
                shape.fill().foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 4 )
                
                Text(emoj)
                    .font(.largeTitle)
                
            }
            
        }.onTapGesture {
            isClicked = !isClicked
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
