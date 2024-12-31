//
//  ThemeManager.swift
//  Memorize
//
//  Created by Thang Le on 30/12/24.
//

import Foundation

class ThemeManager: ObservableObject {
    private static var availableThemes: [Theme] =
        [
            Theme(
                name: "Halloween",
                emojis: ["🎃", "👻", "🧙‍♀️", "🧙‍♂️", "🧛‍♀️", "🧛‍♂️", "🧟‍♀️", "🧟‍♂️", "🧝‍♀️", "🧝‍♂️", "🧞‍♀️", "🧞‍♂️", "🧚‍♀️", "🧚‍♂️", "🦇", "🕸️", "🕷️", "🦂", "☠️", "💀", "👁️", "🪦", "⚰️", "🕯️", "🦉", "🌕", "🌑", "🌒", "🌘", "🌙", "🪄", "🧹", "🪓", "🔮", "🧿"],
                numberOfPairs: 9,
                colorAsHex: 0xFFA500),
            Theme(
                name: "Food",
                emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌶️", "🫑", "🌽", "🥕", "🧄", "🧅", "🥔", "🍠", "🥐", "🍞", "🥖", "🥨", "🧀", "🥚", "🍳", "🥞", "🧇", "🥓", "🥩", "🍗", "🍖", "🦴", "🌭", "🍔", "🍟", "🍕", "🥪", "🥙", "🧆", "🌮", "🌯", "🥗", "🥘", "🫕", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱", "🥟", "🦪", "🍤", "🍙", "🍚", "🍘", "🍥", "🥠", "🥮", "🍢", "🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍿", "🧂", "🥤", "🧃", "🧋", "🍵", "☕", "🍶", "🍺", "🍻", "🥂", "🍷", "🥃", "🍸", "🍹", "🧉", "🍾"],
                numberOfPairs: 7,
                colorAsHex: 0x0000FF),
            Theme(
                name: "Animal",
                emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🦄", "🐔", "🐧", "🐦", "🐤", "🐣", "🐥", "🦆", "🦅", "🦉", "🦇", "🐺", "🐗", "🐴", "🐢", "🐍", "🦎", "🦂", "🦀", "🐟", "🐠", "🐡", "🐙", "🦑", "🦐", "🦞", "🦈", "🐳", "🐋", "🐊", "🦓", "🦒", "🐆", "🐅", "🐃", "🐂", "🐄", "🐪", "🐫", "🦏", "🦛", "🐘", "🦣", "🐁", "🐀", "🐇", "🦨", "🦡", "🦦", "🦥", "🐾"],
                numberOfPairs: 8,
                colorAsHex: 0x008000),
            Theme(
                name: "Hand signs",
                emojis: ["👋", "🤚", "✋", "🖖", "✌️", "🤞", "🤟", "🤘", "🤙", "👌", "👍", "👎", "👊", "✊", "🫱", "🫲", "🫳", "🫴", "🫰", "🙌", "🙏", "👐", "🤲", "🫶"],
                numberOfPairs: 9,
                colorAsHex: 0x5D3FD3)
        ]

    static let shared: ThemeManager = .init()

    @Published var currentTheme: Theme = ThemeManager.availableThemes.randomElement()!

    func randomizeTheme() {
        currentTheme = ThemeManager.availableThemes.filter { $0 != currentTheme }.randomElement()!
    }

    private init() {}
}

struct Theme: Equatable {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let colorAsHex: UInt

    static func ==(lhs: Theme, rhs: Theme) -> Bool {
        lhs.name == rhs.name
    }
}
