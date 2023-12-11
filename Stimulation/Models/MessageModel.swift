//
//  Message.swift
//  Stimulation
//
//  Created by Quendra Verhoef on 09/12/2023.
//

import Foundation

struct Message: Identifiable, Hashable, Codable {
    var id: Int
    var sender: String
    var content: String
    var timestamp: Date
}
