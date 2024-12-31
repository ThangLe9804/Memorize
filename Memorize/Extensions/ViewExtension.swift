//
//  ViewExtension.swift
//  Memorize
//
//  Created by Thang Le on 22/12/24.
//

import SwiftUICore

extension View {
    func mainButtonStyle(using themeManager: ThemeManager) -> some View {
        modifier(MainButtonStyle(theme: themeManager.currentTheme))
    }

    func mainTitleStyle(using themeManager: ThemeManager) -> some View {
        modifier(MainTitleStyle(theme: themeManager.currentTheme))
    }
}

struct MainButtonStyle: ViewModifier {
    let theme: Theme

    func body(content: Content) -> some View {
        content.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            .buttonStyle(.borderedProminent)
            .tint(Color(hex: theme.colorAsHex))
    }
}

struct MainTitleStyle: ViewModifier {
    let theme: Theme

    func body(content: Content) -> some View {
        content.font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(hex: theme.colorAsHex))
            .padding()
    }
}
