//
//  Item.swift
//  iwakura_damashi1
//
//  Created by 左高稜也 on 2025/12/30.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
