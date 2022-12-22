//
//  ContentView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI



struct LoginView: View
{
    @State var isNavigationBarHidden: Bool = true
    @State var isAcvive: Bool = true
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var showingCreateAccountScreen = false
    var body: some View
    {
        NavigationView
        {
            if showingLoginScreen // will direct the user to the TabBarView if showingLoginScreen is true.
            {
                TabBarView()
            }else if showingCreateAccountScreen // will direct the user to the confirmation view if showingCreateAccountScreen is true.
            {
                CreateAccountView()
            }else
            {
                ZStack
                {
                    // the visuals - circles of differant opacity.
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
                        // the only way i can get the logo at the top. This is how i am using spacing but ther is definatly a better way.
                        Image("logo")
                        Text("")
                            .padding().padding().padding().padding().padding().padding().padding().padding().padding().padding()
                        Text("")
                            .padding().padding().padding().padding().padding().padding().padding().padding().padding().padding()
                        Text("")
                            .padding()
                        
                        
                    }
                    .navigationBarHidden(true)
                    
                    VStack
                    {
                        /*
                         Creation of all of the textFields, buttosn and nagigationLinks.
                         */
                        
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                        TextField("Email Address", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.07))
                            .cornerRadius(10)
                        // if the password is wrong, it will be highlighted with a red border.
                            .border(.red, width: CGFloat(wrongUsername))
                        // a SecureField does not allow the user to visuallt see that they are typing.
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.07))
                            .cornerRadius(10)
                        // if the password is wrong it will be highlighted with a red border.
                            .border(.red, width: CGFloat(wrongPassword))
                        Button("Create Account")
                        {
                            showingCreateAccountScreen = true
                        }
                            .foregroundColor(.red)
                            .padding()
                        Button("Login")
                        {
                            // allows access to past login
                            checkCredientals()
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        // used for alignment
                        Text("")
                            .padding()
                        
                    }
                }
            }
            
            
        }
    }
    // Checks username and passsword to all of the usernames and passwordsd in the data files (UserData).
    func checkCredientals() -> Void
    {
        
        @State var userData = loadUserData()
        @State var currentUserData = loadCurrentUserData()
        
        for index in 0 ... userData.count - 1
        {
            let userUsername = userData[index].emailAddress
            let userPassword = userData[index].password
            
            if(username != "" && password != "")
            {
                if(username == userUsername)
                {
                    if(password == userPassword)
                    {
                        currentUserData.append(Users(fullName: userData[index].fullName, securityQuestion:  userData[index].securityQuestion, securityAnswer:  userData[index].securityAnswer, emailAddress:  userData[index].emailAddress, password:  userData[index].password, grade:  userData[index].grade, birthday:  userData[index].birthday, school:  userData[index].school, imageLinkSource:  userData[index].imageLinkSource))
                        showingLoginScreen = true
                    } else
                    {
                        wrongPassword = 2
                    }
                } else
                {
                    wrongUsername = 2
                }
            } else
            {
                wrongPassword = 2
                wrongUsername = 2
            }
        }
        
//        ForEach(userData.indices, id: \.self)
//        {
//            index in
//            var userUsername = userData[index].emailAddress
//            var userPassword = userData[index].password
//
//            if(username == userUsername && password == userPassword)
//            {
//                userData
//            }
//        }
        
//        if (username == userData[1].emailAddress)
//        {
//            if (password == userData[1].password)
//            {
//                showingLoginScreen = true
//
//            }else
//            {
//                wrongPassword = 2
//            }
//        }else
//        {
//            wrongUsername = 2
//        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoginView()
    }
}
