//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel

    @State private var currentEmojis: [String] = []

    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            HStack {
                Button(StringResource.ShuffleButtonTitle, action: { viewModel.shuffle() }).mainButtonStyle()
                Button(StringResource.NewGameButtonTitle, action: { viewModel.makeNewGame() }).mainButtonStyle()
            }
        }
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
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



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
}
