//
//  AttendanceView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct Attendance: Identifiable
{
    let id = UUID()
    let startDate: String
    let endDate: String
    let reason: String
}

struct ConfirmationView: View
{
    @State private var toAttendanceView = false
//    @State private var attendanceInfo = getAttendanceInformation()
    var body: some View
    {
        NavigationView
        {
            if toAttendanceView
            {
                AttendanceView()
            }else
            {
                Form
                {
                    Text("tester")
                    Button("Confirm")
                    {
                        toAttendanceView = true
                    }
                }
            }

        }
    }
}

struct AttendanceView: View
{
    @State private var toStudentProfile = false
    @State private var toConfirmationView = false
    @State private var selectedStartDate = Date()
    @State private var selectedEndDate = Date()
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var reasonForAttendance = ""
    var body: some View {
        NavigationView
        {
            if toStudentProfile
            {
                ProfileView()
            }else if toConfirmationView
            {
                AttendanceConfirmationView()
            }else
            {
                ZStack
                {
                    
                    Color.white
                        .ignoresSafeArea(.all)
                    VStack {
                        Text("Recent Attendance Entries")
                            .font(.title)
                            .bold()
                        
                        Button("User Profile")
                        {
                            toStudentProfile = true
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.red)
                        .cornerRadius(50)
                        Text("Enter Attendance")
                            .font(.largeTitle)
                            .bold()
                        Form
                        {
                            DatePicker("Select start date", selection: $selectedStartDate, displayedComponents: [.date])
                            DatePicker("Select end date", selection: $selectedEndDate, displayedComponents: [.date])
                            Text("Details:")
                            TextField("Reason for Abasence or Tardy", text: $reasonForAttendance)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.07))
                                .cornerRadius(10)
                            Button("Update Attendance")
                            {
                                toConfirmationView = true
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.red)
                            .cornerRadius(10)
                            
                        }
                        
                    }
                    
                }
            .navigationTitle("Attandence")
            }
        }

    }
    func getAttendanceInformation() -> [Attendance]
    {
        let formatter1 = DateFormatter()
        var attendanceInfo: [Attendance] = []
        
        formatter1.dateStyle = .short
        startDate = (formatter1.string(from: selectedStartDate))
        endDate = (formatter1.string(from: selectedEndDate))
        
        
        attendanceInfo.append(Attendance(startDate: startDate, endDate: endDate, reason: reasonForAttendance))
        
        
        return attendanceInfo
    }
}



struct AttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceView()
    }
}
