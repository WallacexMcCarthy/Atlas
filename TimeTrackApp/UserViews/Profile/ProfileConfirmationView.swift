//
//  ProfileConfirmationView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 12/23/22.
//

import SwiftUI

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
    @State private var passwordError = 0
    var body: some View
    {
        if toProfileView
        {
            ProfileView(studentInfo: loadUserData()[0])
        }else if identityChecked == true
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
        }
        else
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
                    
                        .border(.red, width: CGFloat(passwordError))
                        
                    Button("Confirm")
                    {
                        checkPassword(password: enteredPassword)
                        
                    }
                }
            }
        }
    
    }
    /**
        This function will check the password that the user entered to make sure that it matches the password that is stored in the database.
        */
    func checkPassword(password : String)
    {
        var userData = loadCurrentUserData()
        
        if(enteredPassword == userData[0].password)
        {
            identityChecked = true
            
        }else
        {
            passwordError = 2
        }
            
    }
    /**
        This function will append the data that the user entered into the text fields to the database.
        */
    func appendData()
    {
        var userData = loadCurrentUserData()
        
        userData[0].fullName = fullName
        userData[0].password = password
        userData[0].emailAddress = emailAddress
        userData[0].grade = grade
        userData[0].securityAnswer = securityAnswer
        userData[0].securityQuestion = securityQuestion
        userData[0].imageLinkSource = ""
    }
}


struct ProfileConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConfirmationView()
    }
}
