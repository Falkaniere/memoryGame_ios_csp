//
//  ContentView.swift
//  memo
//
//  Created by Jonatas Falkaniere on 18/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojiCount =  6
    let emojis = ["🚀", "🚗", "🛶", "✈️", "🚜", "🛻", "🚁", "🦼", "🛵", "🛴", "🚲", "🏍", "🚍", "🚘", "🚖", "🛥"]
    
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit )
                    }
                }
            }
            .padding()
            .foregroundColor(.red)
            Spacer()
            HStack{
                removeButton
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    
    var removeButton: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }

    var addButton: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }

}



struct CardView: View {
    var content: String
    let shape = RoundedRectangle(cornerRadius: 20)
    
    @State var isFaceUp: Bool = true
    
     var body: some View {
        ZStack{
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
