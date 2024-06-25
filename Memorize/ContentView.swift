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

    @State private var currentEmojis: [String] = []

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
            let emojisCount = currentEmojis.count
            var tempEmojis = currentEmojis
            ForEach(0 ..< emojisCount, id: \.self) { index in
                CardView(content: tempEmojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }

    func setCurrentEmojis(with newEmojis: [String]) {
        currentEmojis = newEmojis
        currentEmojis = currentEmojis.shuffled()
    }

    var setHalloweenThemedButton: some View {
        VStack {
            Button(action: {
                setCurrentEmojis(with: halloweenEmojis)
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
                setCurrentEmojis(with: foodEmojis)
            }, label: {
                Image(systemName: "fork.knife.circle")
                    .font(.largeTitle)
            })
            Text("Food")
                .font(.caption)
        }
        .foregroundColor(.orange)
    }

    var setAnimalThemeButton: some View {
        VStack {
            Button(action: {
                setCurrentEmojis(with: animalEmojis)
            }, label: {
                Image(systemName: "pawprint.circle")
                    .font(.largeTitle)
            })
            Text("Animal")
                .font(.caption)
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let content: String
    let transparent: Double = 0
    let opaque: Double = 1
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? opaque : transparent)
            base.fill(.orange).opacity(isFaceUp ? transparent : opaque)
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
