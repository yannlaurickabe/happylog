//
//  Item.swift
//  happyLog
//
//  Created by Yann-Laurick Abé on 21/10/2025.
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
