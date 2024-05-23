//
//  Item.swift
//  Coopduka
//
//  Created by Michael Amiro on 23/05/2024.
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
