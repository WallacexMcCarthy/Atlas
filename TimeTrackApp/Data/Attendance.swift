//
//  Attendance.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/25/23.
//

import Foundation

struct Attendances : Identifiable
{
    let id = UUID()
    let date: Date
    let absences : Int
    let tardies : Int
    let absentPeriods : [Int]
    let tardiePeriods : [Int]
    
}
