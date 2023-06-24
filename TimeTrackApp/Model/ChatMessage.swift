//
//  ChatMessage.swift
//  TimeTrackApp
//
//  Created by MacBook Pro on 6/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct ChatMessage: Codable, Identifiable {
    @DocumentID var id: String?
    let fromId, toId, text: String
    let timestamp: Date
}

