//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Thang Le on 4/9/24.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable & Hashable {
    private(set) var cards: [Card]
    private var onlyFaceUpCardIndex: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = []

        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let cardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }

    mutating func choose(_ selectedCard: Card) {
        let index = cards.firstIndex(of: selectedCard)

        if index == onlyFaceUpCardIndex {
            flipDownAllCards()
            onlyFaceUpCardIndex = nil
            return
        }

        guard let index else { return }

        if !cards[index].isFaceUp && !cards[index].isMatched {
            if let potentialMatchIndex = onlyFaceUpCardIndex {
                if cards[potentialMatchIndex].content == cards[index].content {
                    cards[index].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            } else {
                onlyFaceUpCardIndex = index
            }
            cards[index].isFaceUp = true
        }
    }

    mutating func shuffleCards() {
        cards.shuffle()
        print(cards)
    }

    mutating func flipDownAllCards() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }

    mutating func makeNewGame() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        shuffleCards()
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent

        var id: Int = UUID().hashValue
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "face up" : "face down") \(isMatched ? "matched" : "not matched")"
        }
    }
}
