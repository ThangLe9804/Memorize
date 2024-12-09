//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel

    let title = "MEMORIZE!"

    @State private var currentEmojis: [String] = []

    var body: some View {
        VStack {
            titleView
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button("Shuffle", action: {viewModel.shuffle()})
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                .buttonStyle(.borderedProminent)
                .tint(.orange)
        }
    }

    var titleView: some View {
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.orange)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(0 ..< viewModel.cards.count, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }

    func setCurrentEmojis(with newEmojis: [String]) {
        currentEmojis = newEmojis
        currentEmojis = currentEmojis.shuffled()
    }
}

struct CardView: View {
    let transparent: Double = 0
    let opaque: Double = 1
    let card: MemoryGameModel<String>.Card

    init(_ card: MemoryGameModel<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? opaque : transparent)
            base.fill(.orange).opacity(card.isFaceUp ? transparent : opaque)
        }
        .shadow(radius: 10)
     }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
}
