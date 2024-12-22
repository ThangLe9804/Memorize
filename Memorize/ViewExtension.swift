//
//  ViewExtension.swift
//  Memorize
//
//  Created by Thang Le on 22/12/24.
//

import SwiftUICore

extension View {
    func mainButtonStyle() -> some View {
        modifier(MainButtonStyle())
    }
}

struct MainButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            .buttonStyle(.borderedProminent)
            .tint(.orange)
    }
}
