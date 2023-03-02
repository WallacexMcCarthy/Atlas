//
//  CreateAccountView.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/23/22.
//

import SwiftUI

/*
 This view allows the user to create an account and the information that is crreated in thsi view will be stored in the user data file / array.
 */

struct CreateAccountView: View {
    @State private var displayLoginScreen = false
    @State private var displayFailure = false
    @State private var confirmationView = false
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
    var body: some View {
        if displayLoginScreen
        {
            LoginView()
        }else if confirmationView
        {
            LoginView()
        }else
        {
            VStack
            {
                
                ZStack
                {
                    Color("Beige")
                        .ignoresSafeArea()

                    VStack
                    {
                        Text("Create Account")
                            .font(.largeTitle)
                            .bold()
                            .padding().padding()
                        Text("")
                            .padding().padding().padding().padding().padding().padding().padding().padding().padding().padding().padding()
                        Text("")
                            .padding().padding().padding().padding().padding().padding().padding()
                    }
                    
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
                                    confirmationView = true
                                    appendData(name: fullName, email: emailAddress, grade: grade, birthdate: birthdate, school: school, securityQuestion: securityQuestion, securityAnswer: securityAnswer, password: password)
                                }else
                                {
                                    displayFailure = true
                                }
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color("Clay"))
                            .cornerRadius(10)
                            
                        }
                        

                    }
                }
               
                
        }
        }
    }
    
    func appendData(name : String, email : String, grade: String, birthdate: String, school: String, securityQuestion: String, securityAnswer : String, password: String)
    {
        var userData = loadUserData()
        
        userData.append(Users(fullName: name, securityQuestion: securityQuestion, securityAnswer: securityAnswer, emailAddress: email, password: password, grade: grade, birthday: birthdate, school: school, imageLinkSource: ""))
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
