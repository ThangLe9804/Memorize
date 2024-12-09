//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Thang Le on 8/9/24.
//

import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    private static let emojis =
    ["👻", "🎃", "🕷️", "🦇", "🧙‍♂️", "🧟‍♂️", "🌕", "⚰️", "🔮", "🍬"]

    let foodEmojis = ["🍕", "🍔", "🍟", "🌭", "🍿", "🥨", "🍩"]
    let animalEmojis = ["🐶", "🐱", "🐭", "🐰", "🐼"]

    private static func createMemoryGame() -> MemoryGameModel<String> {
        return MemoryGameModel(
            numberOfPairsOfCards: 8,
            cardContentFactory: { pairIndex in
                if pairIndex < emojis.count {
                    emojis[pairIndex]
                } else {
                    "‼️"
                }
            })
    }

    @Published  var memoryGameModel: MemoryGameModel<String> = createMemoryGame()

    var cards: [MemoryGameModel<String>.Card] {
        return memoryGameModel.cards
    }

    // MARK: - Intent

    func shuffle() {
        memoryGameModel.shuffle()
    }

    func choose(_ card: MemoryGameModel<String>.Card) {
        memoryGameModel.choose(card)
    }
}
