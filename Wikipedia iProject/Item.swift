//
//  Item.swift
//  Wikipedia iProject
//
//  Created by anna sun on 2/22/25.
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
