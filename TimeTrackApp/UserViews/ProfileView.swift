//
//  ProfileView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct ProfileConfirmationView: View
{
    @State private var toProfileView = false
//    @State private var attendanceInfo = getAttendanceInformation()
    var body: some View
    {
        if toProfileView
        {
            ProfileView(studentInfo: loadUserData()[0])
        }else
        {
            NavigationView
            {
                Form
                {
                    Text("tester")
                    Button("Confirm")
                    {
                        toProfileView = true
                    }
                }
            }
        }
    
    }
}

struct ProfileView: View {
    @State private var toAttendanceView = false
    @State private var toConfirmationView = false
    @State var studentInfo: Users
    var body: some View {
        if toAttendanceView
        {
            AttendanceView()
        }else if toConfirmationView
        {
            ProfileConfirmationView()
        }else
        {
            
            VStack {
                
                Form
                {
    //                Text("User Info")
    //                    .font(Font.title)
    //                    .bold()
                    Image("\(studentInfo.imageLinkSource)")
                    Text("Full Name: \(studentInfo.fullName)")
                    Text("Birthdate: \(studentInfo.birthday)")
                    Text("School: \(studentInfo.school)")
                    Text("Grade: \(studentInfo.grade)")
                    Text("Security Question: \(studentInfo.securityQuestion)")
                    Text("Security Answer: \(studentInfo.securityAnswer)")
                    Text("Email: \(studentInfo.emailAddress)")
                    
                    
                    Button("Edit User Profile Information")
                    {
                        toConfirmationView = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    Button("Return to Attendance")
                    {
                        toAttendanceView = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    
            }
                
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(studentInfo: loadUserData()[0])
    }
}
