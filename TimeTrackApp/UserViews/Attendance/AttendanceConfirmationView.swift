//
//  AttendanceConfirmationView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/23/22.
//

import SwiftUI

/*
 This view is not in use at the moment.
 */
struct AttendanceConfirmationView: View {
    @State private var toAttendanceView = false
    @State private var attendanceInfo = AttendanceView().getAttendanceInformation()
    var body: some View {
        if toAttendanceView
        {
            AttendanceView()
        }else
        {
            Form
            {
//                Text(attendanceInfo[2].startDate)
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
