//
//  ContentView.swift
//  Memorize
//
//  Created by Vinícius Moreira on 24/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).aspectRatio(2 / 3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let CardShape = RoundedRectangle(cornerRadius: 20)

            if card.isFaceUp {
                CardShape.fill().foregroundColor(.white)
                CardShape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                CardShape.opacity(0)
            } else {
                CardShape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()

        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
