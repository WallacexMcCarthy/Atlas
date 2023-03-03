//
//  ContentView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI



struct LoginView: View
{
    @State public var indexValue = -1
    @State public var userUsername = ""
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
                    Color("Beige")
                        .ignoresSafeArea()
                    VStack
                    {
                        // the only way i can get the logo at the top. This is how i am using spacing but ther is definatly a better way.
//                        Image("logo")
                        VStack{
                            
                            Image(systemName: "map.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color("Clay"))
                            Text("ATLAS SCHOOL")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(Color("DarkBlue"))
                        }
                        Text("")
                            .padding().padding().padding().padding().padding().padding().padding().padding().padding().padding()
                        Text("")
                            .padding().padding().padding().padding().padding().padding()
                        
                        
                    }
                    .navigationBarHidden(true)
                    
                    VStack
                    {
                        /*
                         Creation of all of the textFields, buttosn and nagigationLinks.
                         */
                        Spacer()
                            .frame(height: 75)
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                        HStack
                        {
                            Button {
                                
                            } label: {
                                Image("Apple_ID_Icon")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                            }
                            Button {
                                
                            } label: {
                                Image("Facebook_Icon")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                            }
                            Button {
                                
                            } label: {
                                Image("Twitter_Icon")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                            }
                            Button {
                                
                            } label: {
                                Image("Google_Icon")
                                    .resizable()
                                    .frame(width: 75, height: 75)
                            }
                        }
                        Text("or")
                            .padding(.top, 30)
                            .padding(.bottom, 10)
                        Text("Login Using a Personal Email")
                            .font(.title2)
                            .padding(.bottom, 20)
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
                            .foregroundColor(Color("DarkBlue"))
                        Button("Login")
                        {
                            // allows access to past login
//                            something fucked
                            checkCredientals()
//                            showingLoginScreen = true
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
    // Checks username and passsword to all of the usernames and passwordsd in the data files (UserData).
    func checkCredientals() -> Void
    {
        // Grabs all user data from the date folders.
        @State var userData = loadUserData()
        // Grabs the current user data class to update who the current user is in real time.
        @State var currentUserData = loadCurrentUserData()
        // Goes through every user in the database and checks if the usernames and passwords match. IF they do not match then the user is not allowed entry and the respective box outline will appear.
        for index in 0 ... userData.count - 1
        {
            let usersUsername = String(userData[index].emailAddress)
            
            if(username == usersUsername)
            {
                // updates values
                indexValue = index
                currentUserIndexValue = index
                userUsername = usersUsername
            }else
            {
                wrongUsername = 2
            }
        }
        // updates all values to the current user data set assuming that the user has inputed in their correct password and user name.
        if(userData[indexValue].password == password)
        {
            currentUserData.append(CurrentUsers(fullName: userData[indexValue].fullName, securityQuestion:  userData[indexValue].securityQuestion, securityAnswer:  userData[indexValue].securityAnswer, emailAddress:  userData[indexValue].emailAddress, password:  userData[indexValue].password, grade:  userData[indexValue].grade, birthday:  userData[indexValue].birthday, school:  userData[indexValue].school, imageLinkSource:  userData[indexValue].imageLinkSource))
            showingLoginScreen = true
        }else
        {
            wrongPassword = 2
        }
        
        if(userUsername == "" || userUsername == " ")
        {
            showingLoginScreen = false
        }
    
        
        
//        for index in 0 ... userData.count - 1
//        {
//            let usersUsername = userData[index].emailAddress
//            let usersPassword = userData[index].password
//
//            if(username == usersUsername)
//            {
//                if(password == usersPassword)
//                {
//                    currentUserData.append(CurrentUsers(fullName: userData[index].fullName, securityQuestion:  userData[index].securityQuestion, securityAnswer:  userData[index].securityAnswer, emailAddress:  userData[index].emailAddress, password:  userData[index].password, grade:  userData[index].grade, birthday:  userData[index].birthday, school:  userData[index].school, imageLinkSource:  userData[index].imageLinkSource))
//                    showingLoginScreen = true
//                } else
//                {
//                    wrongPassword = 2
//
//                }
//            } else
//            {
//                wrongUsername = 2
//
//            }
//
//
//
//        }
        
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
