//
//  ProfileView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

/*
 Profile Confirmation view will dislay all of the data entered by the user and make the user confirm it and if the data is wrong it will direct the user back to Profile view to restart.
 */

struct ProfileView: View {
    @State private var toAttendanceView = false
    @State private var toConfirmationView = false
    @State var studentInfo: Users
    @State private var identityChecked = false
    @State private var passwordError = 0;
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
                /*
                 displays all of the user's data in a form.
                 */
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
//                    Text("Security Answer: \(studentInfo.securityAnswer)")
                    Text("Security Answer: *****")
                    Text("Email: \(studentInfo.emailAddress)")
                    
                    // directs the user to a eddit profiel page
                    Button("Edit User Profile Information")
                    {
                        toConfirmationView = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue.opacity(0.85))
                    .cornerRadius(10)
                    
                    // directs the user back to AttendanceView
                    Button("Return to Attendance")
                    {
                        toAttendanceView = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue.opacity(0.85))
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
