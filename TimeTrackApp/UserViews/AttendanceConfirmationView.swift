//
//  AttendanceConfirmationView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/23/22.
//

import SwiftUI

struct AttendanceConfirmationView: View {
    @State private var toAttendanceView = false
//    @State private var attendanceInfo = getAttendanceInformation()
    var body: some View {
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

struct AttendanceConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceConfirmationView()
    }
}
