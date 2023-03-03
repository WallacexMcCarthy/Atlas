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
/*
 Confirmation view will dislay all of the data entered by the user and make the user confir it and if the data is wrong it will direct the user back to attendance view to restart.
 */
struct ConfirmationView: View
{
    
    @State private var toAttendanceView = false
    /*
     Gets the array of information that is created by filling out the Enter Atendance Data information.
     */
    @State private var attendanceInfo = AttendanceView().getAttendanceInformation()
    var body: some View
    {
        if toAttendanceView
        {
            AttendanceView()
        }else
        {
            NavigationView
            {
                Form
                {
                    Text("\(attendanceInfo[2].startDate)")
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
            if toStudentProfile == true
            {
                ProfileView(studentInfo: loadUserData()[0])
            }else if toConfirmationView == true && 0 == 1
            {
                AttendanceConfirmationView()
            }else
            {
                ScrollView
                {
                    ZStack
                    {
                        Color("Beige")
                            .ignoresSafeArea()
                        VStack {
                            Text("Attendance")
                                .font(.title)
                                .bold()
                                .padding(30)
                            
                            Section(header: Text("Recent Attendance Entries")
                                .font(Font.title3)
                                .bold()
                                .padding(.bottom, 5)
                            )
                            {
                                Text("01/12/2023: Abasent periods: 5, 7, 8")
                                    .padding(.bottom, 5)
                                Text("01/20/2023: Tardy periods: 2")
                                    .padding(.bottom, 5)
                                Text("01/28/2023: Tardy periods: 1, 4")
                                    .padding(.bottom, 5)
                                Text("02/07/2023: Truent periods: 8")
                                    .padding(.bottom, 5)
                                Text("02/14/2023: Abasent periods: 2, 3")
                                    .padding(.bottom, 5)
                                if (toConfirmationView)
                                {
                                    Text("\(selectedStartDate): \(reasonForAttendance)")
                                        .padding(.bottom, 5)
                                }
                                
                                
                                Section(header: Text("Enter Attendance Data")
                                    .font(Font.title3)
                                    .bold()
                                    .padding()
                                )
                                {
                                    //                                Text("Enter Attendance")
                                    //                                    .font(.largeTitle)
                                    //                                    .bold()
                                    DatePicker("Select start date:", selection: $selectedStartDate, displayedComponents: [.date])
                                        .padding(.leading)
                                        .padding(.horizontal, 40)
                                    DatePicker("Select end date:", selection: $selectedEndDate, displayedComponents: [.date])
                                        .padding(.leading)
                                        .padding(.horizontal, 40)
                                    Text("Details:")
                                        .font(.title3)
                                        .padding()
                                    TextField("Reason for Abasence or Tardy", text: $reasonForAttendance)
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.07))
                                        .cornerRadius(10)
                                    Spacer()
                                        .frame(height: 20)
                                    Button("Update Attendance")
                                    {
                                        toConfirmationView = true
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: 300, height: 50)
                                    .background(Color("Clay"))
                                    .cornerRadius(10)
                                    Spacer()
                                        .frame(height: 30)
                                    Button("User Profile")
                                    {
                                        toStudentProfile = true
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: 300, height: 50)
                                    .background(Color("Clay"))
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
    //            .navigationTitle("Attandence")
                    
                    .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                }
                .background(Color("Beige"))
//            .navigationBarBackButtonHidden()
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
