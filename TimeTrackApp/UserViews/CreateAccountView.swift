//
//  CreateAccountView.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/23/22.
//

import SwiftUI

struct CreateAccountView: View {
    @State var userData = loadUserData()
    @State private var displayLoginScreen = false
    @State private var fullName = ""
    @State private var securityQuestion = ""
    @State private var securityAnswer = ""
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var grade = ""
    @State private var birthdate = ""
    @State private var school = ""
    @State private var imageLink = ""
    var body: some View {
        if displayLoginScreen
        {
            LoginView()
        }else
        {
            VStack
            {
                
                ZStack
                {

                    VStack
                    {
                        Text("Create Account")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        Text("")
                            .padding().padding().padding().padding().padding().padding().padding().padding().padding().padding().padding()
                        Text("")
                            .padding().padding().padding().padding().padding().padding().padding()
                    }
                    
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
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.07))
                            .cornerRadius(10)
                        Button("Create Account")
                        {
                            displayLoginScreen = true
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        Text("")
                        

                    }
                }
    //            userData.append(Users(fullName: fullName, securityQuestion: securityQuestion, securityAnswer: securityAnswer, emailAddress: emailAddress, password: password, grade: grade, birthday: birthdate, school: school, imageLinkSource: imageLink))
                
        }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
