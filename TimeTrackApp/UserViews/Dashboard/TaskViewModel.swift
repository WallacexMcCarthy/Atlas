//
//  TaskViewModel.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/21/23.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var storedTasks: [Task] = [
        Task(title: "Football Game", description: "Home Football Game vs. Stansbury", doneFlag: false, date: Date(timeInterval: 60*5, since: Date.now), index: 0),
        Task(title: "Football Game", description: "Away Football Game vs. Tooele", doneFlag: false, date: Date(timeInterval: 60*15, since: Date.now), index: 1),
        Task(title: "Cross Country", description: "5A & 6A Divisionals Meet", doneFlag: false, date: Date(timeInterval: 60*25, since: Date.now), index: 2),
        Task(title: "Cross Country", description: "USHAA 5A State Championships Meet", doneFlag: false, date: Date(timeInterval: 60*35, since: Date.now), index: 3),
        Task(title: "Marching Band", description: "Bridgerland Band Invitational", doneFlag: false, date: Date(timeInterval: 60*45, since: Date.now), index: 4),
        Task(title: "Marching Band", description: "Wasatch Front Invitational", doneFlag: false, date: Date(timeInterval: 60*55, since: Date.now), index: 5),
        Task(title: "Volleyball (Girls)", description: "Away Volleyball Game vs. Payson", doneFlag: false, date: Date(timeInterval: 60*60, since: Date.now), index: 6),
        Task(title: "Volleyball (Girls)", description: "Away Volleyball Game vs. Cottonwood", doneFlag: false, date: Date(timeInterval: 60*5*60, since: Date.now), index: 7),
        Task(title: "Volleyball (Girls)", description: "Home Volleyball Game vs. Stansbury", doneFlag: false, date: Date(timeInterval: 60*15*60, since: Date.now), index: 8),
        Task(title: "Volleyball (Girls)", description: "Home Volleyball Game vs. Uintah", doneFlag: false, date: Date(timeInterval: 60*25*60, since: Date.now), index: 9),
        Task(title: "Volleyball (Girls)", description: "Home Volleyball Game vs. Cedar Valley", doneFlag: false, date: Date(timeInterval: 60*35*60, since: Date.now), index: 10),
        Task(title: "Volleyball (Girls)", description: "Away Volleyball Game vs. Tooele", doneFlag: false, date: Date(timeInterval: 60*45*60, since: Date.now), index: 11),
        Task(title: "Debate", description: "Beehive Bonanza", doneFlag: false, date: Date(timeInterval: 60*5*30, since: Date.now), index: 12),
        Task(title: "Debate", description: "Beehive Bonanza", doneFlag: false, date: Date(timeInterval: 60*15*30, since: Date.now), index: 13),
        Task(title: "Debate", description: "Westlake Thunderdome Speech and Debate Tournament", doneFlag: false, date: Date(timeInterval: 60*25*30, since: Date.now), index: 14),
        Task(title: "Debate", description: "Westlake Thunderdome Speech and Debate Tournament", doneFlag: false, date: Date(timeInterval: 60*35*30, since: Date.now), index: 15),
        Task(title: "School Dance", description: "Husky Howl", doneFlag: false, date: Date(timeInterval: 60*45*30, since: Date.now), index: 16),
        Task(title: "Threatre", description: "Shakespeare Competition", doneFlag: false, date: Date(timeInterval: 60*55*30, since: Date.now), index: 17),
        Task(title: "Football Game (Sophomore)", description: "Away Football Game vs. Uintah", doneFlag: false, date: Date(timeInterval: 60*60*30, since: Date.now), index: 18),
        Task(title: "Football Game (Sophomore)", description: "Home Football Game vs. Cedar Valley", doneFlag: false, date: Date(timeInterval: 60*60*30, since: Date.now), index: 19),
        Task(title: "Concert", description: "Fall Choir/Orchestra Concert", doneFlag: false, date: Date(timeInterval: 60*6*30, since: Date.now), index: 20),
        Task(title: "Music Social", description: "Music Department Halloween Social", doneFlag: false, date: Date(timeInterval: 60*16*30, since: Date.now), index: 21),
        Task(title: "Football Game", description: "Home Football Game vs. Tooele", doneFlag: false, date: Date(timeInterval: 60*21*30, since: Date.now), index: 22),
        Task(title: "Football Game", description: "Away Football Game vs. Stansbury", doneFlag: false, date: Date(timeInterval: 60*19*30, since: Date.now), index: 23),
        Task(title: "Football Game", description: "Home Football Game vs. Mountain View", doneFlag: false, date: Date(timeInterval: 90*60*30, since: Date.now), index: 24),
        Task(title: "Football Game", description: "Home Football Game vs. Pason", doneFlag: false, date: Date(timeInterval: 60*40*30, since: Date.now), index: 25),
        Task(title: "Football Game", description: "Away Football Game vs. Timpanogos", doneFlag: false, date: Date(timeInterval: 60*50*30, since: Date.now), index: 26),
        Task(title: "Cross Country", description: "Park City Invitational Quinn's Junction", doneFlag: false, date: Date(timeInterval: 60*94*30, since: Date.now), index: 27),
        Task(title: "Cross Country", description: "Border Wars Valley Regional Park", doneFlag: false, date: Date(timeInterval: 60*49*30, since: Date.now), index: 28),
        Task(title: "Cross Country", description: "Royal Run Roy High School", doneFlag: false, date: Date(timeInterval: 60*39*30, since: Date.now), index: 29),
        Task(title: "Cross Country", description: "Region VII Championships Cottonwood Complex", doneFlag: false, date: Date(timeInterval: 60*99*30, since: Date.now), index: 30),
        Task(title: "Threatre", description: "Shakespeare Competition", doneFlag: false, date: Date(timeInterval: 45*6*30, since: Date.now), index: 31),
        Task(title: "Threatre", description: "Shakespeare Competition", doneFlag: false, date: Date(timeInterval: 60*60*54, since: Date.now), index: 32),
        Task(title: "Threatre", description: "Shakespeare Competition", doneFlag: false, date: Date(timeInterval: 54*60*30, since: Date.now), index: 33),
//        Task(title: "Meeting", description: "Discuss team task for the day", doneFlag: true, date: Date(timeInterval: 60, since: Date.now), index: 0),
//        Task(title: "English leeding", description: "", doneFlag: false, date: Date(timeInterval: 60*5, since: Date.now), index: 1),
//        Task(title: "lunch", description: "with Kevin", doneFlag: true, date: Date(timeInterval: 60*10, since: Date.now), index: 2),
//        Task(title: "breakfast", description: "with Alice", doneFlag: false, date: Date(timeInterval: 60*15, since: Date.now), index: 3),
//        Task(title: "coding", description: "It should be at least 100 lines.", doneFlag: false, date: Date(timeInterval: 60*20, since: Date.now), index: 4),
//        Task(title: "learn Go", description: "", doneFlag: true, date: Date(timeInterval: 60*25, since: Date.now), index: 5),
//        Task(title: "game", description: "", doneFlag: true, date: Date(timeInterval: 60*30, since: Date.now), index: 6),
//        Task(title: "buy the iphone", description: "", doneFlag: false, date: Date(timeInterval: 60*35, since: Date.now), index: 7),
    ]
    
    // MARK: - Current Day
    @Published var currentDay: Date = Date()
    
    // MARK: - Filtering Today Tasks
    @Published var filteredTasks: [Task]?
    
    // MARK: - Initializing
    init() {
        filterTodayTasks()
    }
    
    // MARK: - Filter Today Tasks
    func filterTodayTasks() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filtered = self.storedTasks.filter {
                return calendar.isDate($0.date, inSameDayAs: self.currentDay)
            }
                .sorted { task1, task2 in
                    return task2.date > task1.date
                }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredTasks = filtered
                }
            }
        }
    }
    
    // MARK: - Checking if the currentHour is task Hour
    func isCurrentHour(date: Date) -> Bool {
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        
        return hour == currentHour
    }
}
