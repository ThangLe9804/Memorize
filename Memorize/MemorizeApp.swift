//
//  MemorizeApp.swift
//  Memorize
//
//  Created by lhth on 19/3/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGameViewModel()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
