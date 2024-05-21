//
//  ContentView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct ContentView: View {
    let halloweenEmojis = ["👻", "🎃", "🕷️", "🦇", "🧙‍♂️", "🧟‍♂️", "🌕", "⚰️", "🔮", "🍬"]
    let foodEmojis = ["🍕", "🍔", "🍟", "🌭", "🍿", "🥨", "🍩", "🍦", "🍉", "🍇"]
    let animalEmojis = ["🐶", "🐱", "🐭", "🐰", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷"]

    let title = "MEMORIZE!"

    @State var currentEmojis: [String]
    @State var cardCount: Int = 4

    init() {
        self.currentEmojis = halloweenEmojis
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
    }

    var themeChoosing: some View {
        HStack {
            setHalloweenThemedButton
            Spacer()
            setFoodThemeButton
            Spacer()
            setAnimalThemeButton
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding([.leading, .trailing])
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(0 ..< cardCount, id: \.self) { index in
                CardView(content: currentEmojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }

    var setHalloweenThemedButton: some View {
        Button(action: {
            currentEmojis = halloweenEmojis
        }, label: {
            Image(systemName: "flame.circle")
                .font(.largeTitle)
        })
        .tint(.orange)
    }

    var setFoodThemeButton: some View {
        Button(action: {
            currentEmojis = foodEmojis
        }, label: {
            Image(systemName: "fork.knife.circle")
                .font(.largeTitle)
        })
        .tint(.orange)
    }

    var setAnimalThemeButton: some View {
        Button(action: {
            currentEmojis = animalEmojis
        }, label: {
            Image(systemName: "pawprint.circle")
                .font(.largeTitle)
        })
        .tint(.orange)
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
