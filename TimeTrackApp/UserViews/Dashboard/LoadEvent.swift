//
//  LoadEvent.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/15/23.
//

import Foundation
import SwiftUI

func loadEvent(date: Date) -> Maps {
    let maps = loadMapData()
    for i in 0..<maps.count{
        if(maps[i].date == date){
            return maps[i]
        }
    }
    return maps[0]
}
