//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Thang Le on 11/1/25.
//

import SwiftUI

struct AspectVGrid<Element: Identifiable, Content: View>: View {
    var items: [Element]
    var aspectRatio: CGFloat = 1
    var content: (Element) -> Content

    var body: some View {
        GeometryReader { geometry in
            let gridItemSize =
                gridItemWidthThatFits(
                    count: items.count,
                    size: geometry.size,
                    atAspectRatio: aspectRatio)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }

    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        atAspectRatio aspectRatio: CGFloat
    ) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio

            let rowCount = (count / columnCount).rounded(.up)

            if rowCount * height < size.height {
                return (size.width / columnCount).rounded(.down)
            }

            columnCount += 1
        } while columnCount < count

        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}
