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
struct ProfileConfirmationView: View
{
    @State private var toProfileView = false
//    @State private var attendanceInfo = getAttendanceInformation()
    @State private var userData = loadCurrentUserData()
    @State private var enteredPassword = ""
    @State private var identityChecked = false
    @State private var displayLoginScreen = false
    @State private var displayFailure = false
    @State public var fullName = ""
    @State public var securityQuestion = ""
    @State public var securityAnswer = ""
    @State public var emailAddress = ""
    @State public var password = ""
    @State public var checkPassword = ""
    @State public var grade = ""
    @State public var birthdate = ""
    @State public var school = ""
    @State public var imageLink = ""
    var body: some View
    {
        if toProfileView
        {
            ProfileView(studentInfo: loadUserData()[0])
        }else if identityChecked
        {
            VStack
            {
                // Creates the text fields that the user can type in.
                VStack
                {
                    TextField("Full Name", text: $fullName)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                    TextField("Email Address", text: $emailAddress)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                    TextField("Grade", text: $grade)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                }
                TextField("Birthday (00/00/0000)", text: $birthdate)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                TextField("School", text: $school)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                TextField("Security Question", text: $securityQuestion)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                TextField("Security Answer", text: $securityAnswer)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                TextField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                TextField("Confirm Password", text: $checkPassword)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                
                VStack
                {
                    if displayFailure
                    {
                        Text("Passwords do not match!")
                            .font(Font.title3)
                            .foregroundColor(.red)
                    }
                    // the button that will bring the user to the confirmation create account view.
                    Button("Create Account")
                    {
                        if checkPassword == password
                        {
                            appendData()
                            
                        }else
                        {
                            displayFailure = true
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                }
            }
        } else
        {
            NavigationView
            {
                Form
                {
                    SecureField("Password", text: $enteredPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                        
                    Button("Confirm")
                    {
                        checkPassword(password: enteredPassword)
                    }
                }
            }
        }
    
    }
    func checkPassword(password : String)
    {
        var userData = loadCurrentUserData()
        
        if(password == userData[0].password)
        {
            identityChecked = true
        }
    }
    func appendData()
    {
        var userData = loadCurrentUserData()
        
//        userData[0].fullName = fullName
//        userData[0].password = password
//        userData[0].emailAddress = emailAddress
//        userData[0].grade = grade
//        userData[0].securityAnswer = securityAnswer
//        userData[0].securityQuestion = securityQuestion
//        userData[0].
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
                    Text("Security Answer: \(studentInfo.securityAnswer)")
                    Text("Email: \(studentInfo.emailAddress)")
                    
                    // directs the user to a eddit profiel page
                    Button("Edit User Profile Information")
                    {
                        toConfirmationView = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    
                    // directs the user back to AttendanceView
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
