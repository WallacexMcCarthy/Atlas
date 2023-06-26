 //
//  ContentView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI
import Firebase

struct LoginView: View
{
    @State public var indexValue = -1
    @State public var userUsername = ""
    @State var isNavigationBarHidden: Bool = true
    @State var isAcvive: Bool = true
    @State var email = ""
    @State var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var showingCreateAccountScreen = false
    @State private var showWebView = false
    
    private let appleID = URL(string: "https://appleid.apple.com/sign-in")!
    private let twitter = URL(string: "https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D")!
    private let facebook = URL(string: "https://www.facebook.com/login/")!
    private let google = URL(string: "https://accounts.google.com/v3/signin/identifier?dsh=S-167491447%3A1677947572963072&continue=https%3A%2F%2Faccounts.google.com%2F&followup=https%3A%2F%2Faccounts.google.com%2F&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AWnogHcj9hlvvTDFd6I4lqZHGXZFw2XtrXHJdMXmkI3lkvA982RB1gAMxwIE86Minv1Zmd2b81H-wA")!
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
                ScrollView() {
                    ZStack
                    {
                        VStack
                        {
                            // the only way i can get the logo at the top. This is how i am using spacing but ther is definatly a better way.
                            //                        Image("logo")
                            VStack{
                                
                                Image(systemName: "map.circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color("AzureBlue"))
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
                                    showWebView.toggle()
                                } label: {
                                    Image("Apple_ID_Icon")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                }
                                //                            .sheet(isPresented: $showWebView)
                                //                            {
                                //                                WebView(url: appleID)
                                //                            }
                                Button {
                                    showWebView.toggle()
                                } label: {
                                    Image("Facebook_Icon")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                }
                                .sheet(isPresented: $showWebView)
                                {
                                    WebView(url: facebook)
                                }
                                Button {
                                    showWebView.toggle()
                                    
                                } label: {
                                    Image("Twitter_Icon")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                }
                                .sheet(isPresented: $showWebView)
                                {
                                    WebView(url: twitter)
                                }
                                Button {
                                    showWebView.toggle()
                                } label: {
                                    Image("Google_Icon")
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                }
                                .sheet(isPresented: $showWebView)
                                {
                                    WebView(url: google)
                                }
                            }
                            Text("or")
                                .padding(.top, 30)
                                .padding(.bottom, 10)
                            Text("Login Using a Personal Email")
                                .font(.title2)
                                .padding(.bottom, 20)
                            TextField("Email Address", text: $email)
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
                                loginUser()
                                //                            showingLoginScreen = true
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color("AzureBlue"))
                            .cornerRadius(10)
                            
                            
                        }
                    }
                }
            }
        }
    }
    
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
        }
    }
    
    @State var loginStatusMessage = ""
    
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("failed", err)
                return
            }
            
            print("success \(result?.user.uid ?? "") ")
        }
    }
    
    // Checks email and passsword to all of the usernames and passwords in the data files (UserData).
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
            
            if(email == usersUsername)
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
    }
    
}
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoginView()
    }
}
