//
//  AttendancesData.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/25/23.
//

import Foundation

func loadAttendanceData() -> [Attendances]
{
    // creates an array of the struct Users
    var attendanceItems : [Attendances] = []
    
    let date: [Date] =
    [
            Date(timeInterval: -60*60*24, since: Date.now),
            Date(timeInterval: -60*60*24*3, since: Date.now),
            Date(timeInterval: -60*60*24*5, since: Date.now),
            Date(timeInterval: -60*60*24*17, since: Date.now),
            Date(timeInterval: -60*60*24*22, since: Date.now),
            Date(timeInterval: -60*60*24*31, since: Date.now),
            Date(timeInterval: -60*60*24*32, since: Date.now),
            Date(timeInterval: -60*60*24*35, since: Date.now)
            
    ]
    let absences : [Int] =
    [
        1,
        1,
        2,
        4,
        1,
        3,
        1,
        1
    ]
    let tardies : [Int] =
    [
        2,
        1,
        1,
        0,
        2,
        0,
        0,
        3
    ]
    let absentPeriods : [[Int]] =
    [
        [1],
        [3],
        [1, 2],
        [1, 2, 3, 4],
        [3],
        [1, 2, 4],
        [1],
        [1],
    ]
    let tardiePeriods : [[Int]] =
    [
        [2, 3],
        [1],
        [3],
        [],
        [1, 2],
        [],
        [],
        [2, 3, 4],
    ]
    for index in 0 ..< 8{
        attendanceItems.append(Attendances(date: date[index], absences: absences[index], tardies: tardies[index], absentPeriods: absentPeriods[index], tardiePeriods: tardiePeriods[index]))
    }
    return attendanceItems
}
