//
//  ArrayExtension.swift
//  Memorize
//
//  Created by Thang Le on 22/12/24.
//

import Foundation

extension Array {
    /// return the only element of array, nil otherwise
    var only: Element? {
        count == 1 ? first : nil
    }
}
