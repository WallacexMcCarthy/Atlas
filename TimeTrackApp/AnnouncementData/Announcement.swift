//
//  Announcement.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/24/22.
//

import Foundation
/* craates all fo the variabels taht will be used in the array, simmilar to a database.
 I am currently trying to impliemnt Core Data or SQLite to remove the rudendancies of these files and data.
 */

struct Announcments : Identifiable
{
    // creates a origional id every time every time it is used / called.
    let id = UUID()
    let announcement: String
    let date: String
    let type: String
    
}
