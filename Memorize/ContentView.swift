//
//  ContentView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct ContentView: View {
    let halloweenEmojis = ["👻", "🎃", "🕷️", "🦇", "🧙‍♂️", "🧟‍♂️", "🌕", "⚰️", "🔮", "🍬", "👻", "🎃", "🕷️", "🦇", "🧙‍♂️", "🧟‍♂️", "🌕", "⚰️", "🔮", "🍬"]
    let foodEmojis = ["🍕", "🍔", "🍟", "🌭", "🍿", "🥨", "🍩", "🍕", "🍔", "🍟", "🌭", "🍿", "🥨", "🍩"]
    let animalEmojis = ["🐶", "🐱", "🐭", "🐰", "🐼", "🐶", "🐱", "🐭", "🐰", "🐼"]

    let title = "MEMORIZE!"

    @State var currentEmojis: [String]
    @State var cardCount: Int = 12

    init() {
        self.currentEmojis = halloweenEmojis
        self.cardCount = self.currentEmojis.count
    }

    var body: some View {
        VStack {
            titleView
            ScrollView {
                cards
            }
            Spacer()
            themeChoosing
        }
    }

    var titleView: some View {
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.orange)
    }

    var themeChoosing: some View {
        HStack(alignment: .center) {
            Spacer()
            setHalloweenThemedButton
            Spacer()
            setFoodThemeButton
            Spacer()
            setAnimalThemeButton
            Spacer()
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding([.leading, .trailing])
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(0 ..< cardCount, id: \.self) { _ in
                CardView(content: currentEmojis[Int.random(in: 0 ..< currentEmojis.count)])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }

    var setHalloweenThemedButton: some View {
        VStack {
            Button(action: {
                currentEmojis = halloweenEmojis
                cardCount = currentEmojis.count
            }, label: {
                Image(systemName: "flame.circle")
                    .font(.largeTitle)
            })
            Text("Halloween")
                .font(.caption)
        }
        .foregroundColor(.orange)
    }

    var setFoodThemeButton: some View {
        VStack {
            Button(action: {
                currentEmojis = foodEmojis
                cardCount = currentEmojis.count
            }, label: {
                Image(systemName: "fork.knife.circle")
                    .font(.largeTitle)
            })
            Text("food")
                .font(.caption)
        }
        .foregroundColor(.orange)
    }

    var setAnimalThemeButton: some View {
        VStack {
            Button(action: {
                currentEmojis = animalEmojis
                cardCount = currentEmojis.count
            }, label: {
                Image(systemName: "pawprint.circle")
                    .font(.largeTitle)
            })
            Text("animal")
                .font(.caption)
        }
        .foregroundColor(.orange)
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
