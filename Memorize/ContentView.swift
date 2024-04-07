//
//  ContentView.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["🎃", "😈", "👻", "💀"]

        VStack {
            HStack {
                ForEach(0 ..< emojis.count, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            .padding()
            HStack {
                Button("add card", action: {
                    print("ADD card clicked")
                })
                Spacer()
                Button("remove card", action: {
                    print("REMOVE card clickee")
                })
            }.buttonStyle(.borderedProminent)
                .padding([.leading, .trailing])
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.foregroundColor(.orange)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
