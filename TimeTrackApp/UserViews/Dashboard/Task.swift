//
//  Task.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/21/23.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var doneFlag: Bool
    var date: Date
}
