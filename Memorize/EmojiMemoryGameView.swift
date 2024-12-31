//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            HStack {
                Button(StringResource.ShuffleButtonTitle, action: { viewModel.shuffleCards() }).mainButtonStyle(using: themeManager)
                Button(StringResource.NewGameButtonTitle, action: { viewModel.makeNewGame() }).mainButtonStyle(using: themeManager)
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
        .foregroundColor(Color(hex: themeManager.currentTheme.colorAsHex))
        .padding()
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
        .environmentObject(ThemeManager.shared)
}
