//
//  Item.swift
//  Stimulation
//
//  Created by Konrad Sokołowski on 09/12/2023.
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
