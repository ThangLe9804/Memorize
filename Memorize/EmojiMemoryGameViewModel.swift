//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Thang Le on 8/9/24.
//

import Foundation
import SwiftUICore

class EmojiMemoryGameViewModel: ObservableObject {
    private static func createMemoryGame() -> MemoryGameModel<String> {
        return MemoryGameModel()
    }

    @Published var memoryGameModel: MemoryGameModel<String> = createMemoryGame()

    var cards: [MemoryGameModel<String>.Card] {
        return memoryGameModel.cards
    }

    // MARK: - Intent

    func shuffleCards() {
        memoryGameModel.shuffleCards()
    }

    func choose(_ card: MemoryGameModel<String>.Card) {
        memoryGameModel.choose(card)
    }

    func makeNewGame() {
        memoryGameModel.makeNewGame()
    }
}
