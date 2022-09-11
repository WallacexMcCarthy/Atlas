//
//  ContentView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct LoginView: View
{
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    var body: some View
    {
        NavigationView
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
                    Text("Time Track")
                        .font(Font.custom("NewFont", size: 50))
                        .bold()
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login")
                    {
                        // allows access to past login
                        // checkCredientals()
                        showingLoginScreen = true
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: TabBarView(), isActive: $showingLoginScreen)
                    {
                        
                    }
                    
                }
                
            }
        }
        .navigationBarHidden(true)
    }
    func checkCredientals() -> Void
    {
        if username == "Wallace"
        {
            if password == "123"
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
