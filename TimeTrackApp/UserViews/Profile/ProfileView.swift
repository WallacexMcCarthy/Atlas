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
    @State private var logout = false
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
        }else if logout
        {
            LoginView()
        }else
        {
            
            ScrollView
            {
                
                ZStack {
                    
                    /*
                     displays all of the user's data in a form.
                     */
                    VStack
                    {
                        Spacer()
                            .frame(height: 60)
                        Text("User Info")
                            .font(Font.title)
                            .bold()
                        VStack
                        {
                            Image("\(studentInfo.imageLinkSource)")
                                .frame(width: 400, height: 300)
                            Text("Full Name: \(studentInfo.fullName)")
                                .frame(width: 400, height: 50)
                                .background(Color("Beige"))
                            Text("Birthdate: \(studentInfo.birthday)")
                                .frame(width: 400, height: 50)
                                .background(Color("Beige"))
                            Text("School: \(studentInfo.school)")
                                .frame(width: 400, height: 50)
                                .background(Color("Beige"))
                            Text("Grade: \(studentInfo.grade)")
                                .frame(width: 400, height: 50)
                                .background(Color("Beige"))
                            Text("Security Question: \(studentInfo.securityQuestion)")
                                .frame(width: 400, height: 50)
                                .background(Color("Beige"))
                        }
    //                    Text("Security Answer: \(studentInfo.securityAnswer)")
                        Text("Security Answer: *****")
                            .frame(width: 400, height: 50)
                            .background(Color("Beige"))
                        Text("Email: \(studentInfo.emailAddress)")
                            .frame(width: 400, height: 50)
                            .background(Color("Beige"))
                        
                        // directs the user to a eddit profiel page
                        Button("Edit User Profile Information")
                        {
                            toConfirmationView = true
                        }
                        .foregroundColor(Color("DarkBlue"))
                        .frame(width: 300, height: 50)
                        .background(Color("Clay"))
                        .cornerRadius(10)
                        
                        // directs the user back to AttendanceView
                        Button("Return to Attendance")
                        {
                            toAttendanceView = true
                        }
                        .foregroundColor(Color("DarkBlue"))
                        .frame(width: 300, height: 50)
                        .background(Color("Clay"))
                        .cornerRadius(10)
                        Button("Logout")
                        {
                            logout = true
                        }
                        .foregroundColor(Color("DarkBlue"))
                        .frame(width: 300, height: 50)
                        .background(Color("Clay"))
                        .cornerRadius(10)
                        Spacer()
                            .frame(height: 80)
                        
                    }
                    .background(Color("Beige"))
                    
                }
            }
            .background(Color("Beige"))
            .ignoresSafeArea()
            
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(studentInfo: loadUserData()[0])
    }
}
