//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Thang Le on 4/9/24.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = []

        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let cardContent = cardContentFactory(pairIndex)
            let newCard = Card(content: cardContent)
            cards.append(newCard)
            cards.append(newCard)
        }
    }

    func choose(_ card: Card) {}

    mutating func shuffle() {
        cards.shuffle()
        print(cards.map { $0.content })
    }

    struct Card: Equatable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
