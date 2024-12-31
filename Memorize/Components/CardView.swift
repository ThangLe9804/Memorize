//
//  CardView.swift
//  Memorize
//
//  Created by Thang Le on 22/12/24.
//

import SwiftUI

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
            base
                .fill(Color(hex: ThemeManager.shared.currentTheme.colorAsHex))
                .opacity(card.isFaceUp ? transparent : opaque)
        }
        .shadow(radius: 10)
        .opacity(card.isFaceUp || !card.isMatched ? opaque : transparent)
    }
}
