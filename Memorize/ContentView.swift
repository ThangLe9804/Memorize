//
//  ContentView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount: Int = 4
    let emojis = ["✌", "😂", "😝", "😁", "😱", "👉", "🙌", "🍻", "🔥", "🌈", "☀", "🎈", "🌹", "💄", "🎀", "⚽", "🎾", "🏁", "😡", "👿", "🐻", "🐶", "🐬", "🐟", "🍀", "👀", "🚗", "🍎", "💝", "💙", "👌", "❤", "😍", "😉", "😓", "😳", "💪", "💩", "🍸", "🔑", "💖", "🌟", "🎉", "🌺", "🎶", "👠", "🏈", "⚾", "🏆", "👽", "💀", "🐵", "🐮", "🐩", "🐎", "💣", "👃", "👂", "🍓", "💘", "💜", "👊", "💋", "😘", "😜", "😵", "🙏", "👋", "🚽", "💃", "💎", "🚀", "🌙", "🎁", "⛄", "🌊", "⛵", "🏀", "🎱", "💰", "👶", "👸", "🐰", "🐷", "🐍", "🐫", "🔫", "👄", "🚲", "🍉", "💛", "💚"]

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardsModifier
        }
    }

    var cardsModifier: some View {
        HStack {
            cardAdderButton
            Spacer()
            cardRemoverButton
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding([.leading, .trailing])
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 180))]) {
            ForEach(0 ..< cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }

    func cardCountModifier(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var cardAdderButton: some View {
        cardCountModifier(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }

    var cardRemoverButton: some View {
        cardCountModifier(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 0 : 1)
            base.fill(.orange).opacity(isFaceUp ? 1 : 0)
        }
        .shadow(radius: 10)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
