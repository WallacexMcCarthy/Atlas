//
//  CreateAccountView.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/23/22.
//

import SwiftUI

struct CreateAccountView: View {
    @State var userData = loadUserData()
    @State private var fullName = ""
    @State private var securityQuestion = ""
    @State private var securityAnswer = ""
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var grade = 0
    @State private var birthday = ""
    @State private var school = ""
    @State private var imageLinkSource = ""
    var body: some View {
        VStack
        {
            ZStack
            {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.17))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack
                {
                    Text("Create Account")
                        .font(.largeTitle)
                        .bold()
                        .padding()
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
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
        //            TextField("Grade", text: $grade)
        //                .padding()
        //                .frame(width: 300, height: 50)
        //                .background(Color.black.opacity(0.07))
        //                .cornerRadius(10)
                    TextField("Birthday (00/00/0000)", text: $birthday)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                    TextField("School", text: $school)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                }
            }
            
        }
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
