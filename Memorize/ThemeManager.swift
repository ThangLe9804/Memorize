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
                numberOfPairs: 5,
                colorAsHex: 0x008000),
            Theme(
                name: "Hand signs",
                emojis: ["👋", "🤚", "✋", "🖖", "✌️", "🤞", "🤟", "🤘", "🤙", "👌", "👍", "👎", "👊", "✊", "🫱", "🫲", "🫳", "🫴", "🫰", "🙌", "🙏", "👐", "🤲", "🫶"],
                numberOfPairs: 6,
                colorAsHex: 0x5D3FD3)
        ]

    static let shared: ThemeManager = .init()

    @Published var theme: Theme = ThemeManager.availableThemes.randomElement()!

    func randomizeTheme() {
        theme = ThemeManager.availableThemes.filter { $0 != theme }.randomElement()!
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
