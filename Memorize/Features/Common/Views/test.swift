//
//  test.swift
//  Memorize
//
//  Created by ammar on 10/07/2023.
//

import SwiftUI

struct test: View {
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 8 )
        ZStack{
            shape
                .frame(width: 50,height: 150)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.red)
            
            shape
                .fill()
                .frame(width: 45,height: 145)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.white)
                .cornerRadius(8)
            Text("A")
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
