//
//  ContentView.swift
//  Memorize
//
//  Created by Vinícius Moreira on 24/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojiCount = 6
    @State var emojis = [ "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚁", "✈️", "🚀", "🛶"]
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack {
                Button{
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                } label: { Image(systemName: "minus.square") }
                Spacer()
                Button{
                    emojis.shuffle()
                } label: { Image(systemName: "shuffle") }
                Spacer()
                Button{
                    if emojiCount < emojis.count {
                        emojiCount += 1
                    }
                } label: { Image(systemName: "plus.square") }
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    
    var body: some View {
        ZStack {
            let CardShape = RoundedRectangle(cornerRadius: 20);
            
            if isFaceUp {
                CardShape.fill().foregroundColor(.white)
                CardShape.stroke(lineWidth: 3).fill()
                Text(content).font(.largeTitle)
            } else {
                CardShape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
