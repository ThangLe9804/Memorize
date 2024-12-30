//
//  ColorExtension.swift
//  Memorize
//
//  Created by Thang Le on 29/12/24.
//

import Foundation
import SwiftUICore

// https://stackoverflow.com/a/56894458
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
