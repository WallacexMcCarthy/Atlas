//
//  AnnouncementData.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/24/22.
//

import Foundation

func loadAnnouncementData() -> [Announcments]
{
    var announcementItems : [Announcments] = []
    
    let announcement: [String] =
    [
        "First day of school",
        "Second day of school",
        "Football game"
    ]
    
    let date: [String] =
    [
        "08/26/2022",
        "08/27/2022",
        "09/08/2022"
    ]
    
    let type: [String] =
    [
        "Achedemic",
        "Achedemic",
        "Sports"
    ]
    
    for index in 0 ..< 3
    {
       
        announcementItems.append(Announcments(announcement: announcement[index], date: date[index], type: type[index]))
    }
    
    return announcementItems
}
