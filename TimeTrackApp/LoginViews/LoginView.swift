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
    var body: some View
    {
        NavigationView
        {
            if showingLoginScreen
            {
                TabBarView()
            }else
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
                        // the only way i can get the logo at the top
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
    //                    Text("Time Track")
    //                        .font(Font.custom("NewFont", size: 50))
    //                        .bold()
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.07))
                            .cornerRadius(10)
                        // if the password is wrong, it will be highlighted with a red border
                            .border(.red, width: CGFloat(wrongUsername))
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.07))
                            .cornerRadius(10)
                        // if the password is wrong it will be highlighted with a red border
                            .border(.red, width: CGFloat(wrongPassword))
                        
                        Button("Login")
                        {
                            // allows access to past login
                            checkCredientals()
//                            showingLoginScreen = true
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
    // Checks username and passsword
    func checkCredientals() -> Void
    {
        
        @State var userData = loadUserData()
        
        
        if (username == userData[1].emailAddress)
        {
            if (password == userData[1].password)
            {
                showingLoginScreen = true
            }else
            {
                wrongPassword = 2
            }
        }else
        {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoginView()
    }
}
