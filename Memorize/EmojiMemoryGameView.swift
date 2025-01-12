//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel

    let aspectRatio: CGFloat = 2 / 3

    var body: some View {
        VStack {
            cards.animation(.default, value: viewModel.cards)
            Spacer()
            HStack {
                Button(StringResource.ShuffleButtonTitle, action: { viewModel.shuffleCards() }).mainButtonStyle()
                Button(StringResource.NewGameButtonTitle, action: { viewModel.makeNewGame() }).mainButtonStyle()
            }
        }
    }

    private var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
}
