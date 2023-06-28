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

struct ProfileView: View {
    func buttonPressed(){
        print("")
    }
    @State private var isPressed = false
    @State private var counter = 0
    @State private var toAttendanceView = false
    @State private var toConfirmationView = false
    @State private var logout = false
    @State var studentInfo: Users
    @State private var identityChecked = false
    @State private var passwordError = 0;
    @State private var spacingLeft: CGFloat = 0.0
    @State private var spacingRight: CGFloat = 175.0
    @State private var isProfile: Bool = true
    @State private var fullName = "Dheeraj"
    @State public var securityQuestion = ""
    @State public var securityAnswer = ""
    @State public var emailAddress = ""
    @State public var password = ""
    @State public var checkPassword = ""
    @State public var grade = ""
    @State public var birthdate = ""
    @State public var school = ""
    //
    @State private var toStudentProfile = false
    @State private var selectedStartDate = Date()
    @State private var selectedEndDate = Date()
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var reasonForAttendance = ""
    @State private var boxOneName = "chevron.up"
    @State private var boxOneText = "Attendace One Test"
    @State private var boxTwoName = "chevron.up"
    @State private var boxTwoText = "Attendace Two Test"
    @State private var boxThreeName = "chevron.up"
    @State private var boxThreeText = "Attendace Three Test"
    @State private var boxFourName = "chevron.up"
    @State private var boxFourText = "Attendace Four Test"
    @State private var boxFiveName = "chevron.up"
    @State private var boxFiveText = "Attendace Five Test"
    @State private var attendaceInfo = loadAttendanceData()
    // Image Picker
    @State var imageSelectedOne = UIImage()
    @State var newImagePickerOne = false
    @State var changeProfileIamge = false
    @State var openCameraRoll = false
    @State var showWebView = false

    var body: some View {
        if toAttendanceView
        {
            AttendanceView()
        }else if toConfirmationView
        {
            ProfileConfirmationView()
        }else if logout
        {
            LoginView()
        }else
        {
            
            VStack {
                VStack {
                            Spacer()
                        .frame(height: 50)
                            ZStack {
                                VStack{
                                    Spacer()
                                        .frame(height: 20)
                                    ZStack{
                                        Capsule()
                                            .frame(width: 350, height: 51)
                                            .foregroundColor(.blue)
                                        HStack{
                                            Spacer()
                                                .frame(width: spacingLeft)
                                            Capsule().frame(width: 175, height: 50)
                                                .foregroundColor(.white.opacity(0.3))
                                            Spacer()
                                                .frame(width: spacingRight)
                                        }
                                        HStack{
                                            Spacer()
                                                .frame(width: 30)
                                            Text("Profile")
                                                .font(.title2)
                                                .bold()
                                                .foregroundColor(.white)
                                            Spacer()
                                                .frame(width: 85)
                                            Text("Attendance")
                                                .font(.title2)
                                                .bold()
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                            .scaleEffect(isPressed ? 1.05 : 1.0)
                            .opacity(isPressed ? 0.6 : 1.0)
                            .onTapGesture {
                                counter += 1
                            }
                            .pressEvents {
                                // On press
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    isPressed = true
                                }
                            } onRelease: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05)
                                {
                                    withAnimation {
                                        if(spacingRight == 0){
                                            spacingRight = spacingLeft
                                            spacingLeft = 0
                                            isProfile = true
                                        }
                                        else if(spacingLeft == 0){
                                            spacingLeft = spacingRight
                                            spacingRight = 0
                                            isProfile = false
                                        }
                                        isPressed = false
                                    }
                                }
                            }
                        }
                // image picker below
                .sheet(isPresented: $openCameraRoll)
                {
                    ImagePicker(selectedImage: $imageSelectedOne, sourceType: .photoLibrary)
                    
                }
                .ignoresSafeArea()
//                .background(Color("Beige"))

                
                ScrollView
                {
                    VStack
                    {
                        
                        ZStack {
                            
                            /*
                             displays all of the user's data in a form.
                             */
                            VStack
                            {
                                
                                Spacer()
                                    .frame(height: 45)
                                if(isProfile){
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 370, height: 480)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.white)                                                          .shadow(color: .black, radius: 5, x : 0, y : 4)
                                            .position(x: 196, y: 221)
                                        VStack
                                        {
                                            ZStack {

                                                Button{
                                                    
                                                } label: {
                                                    if(changeProfileIamge)
                                                    {
                                                        Image(uiImage: imageSelectedOne)
                                                            .resizable()
                                                            .frame(width: 140, height: 140)
                                                            .foregroundColor(.white)
                                                        
                                                            .clipShape(Circle())
                                                            .overlay(Circle().stroke( Color.blue, lineWidth: 5))
                                                    }else{
                                                        Image("\(studentInfo.imageLinkSource)")
                                                            .resizable()
                                                            .frame(width: 140, height: 140)
                                                            .foregroundColor(.white)
                                                        
                                                            .clipShape(Circle())
                                                            .overlay(Circle().stroke( Color.blue, lineWidth: 5))
                                                    
                                                    }
                                                }
                                                .disabled(true)
                                                VStack {
                                                    HStack{
                                                        Spacer()
                                                            .frame(width: 100)
                                                        Button{
                                                            // image Picker
                                                            changeProfileIamge = true
                                                                                                   openCameraRoll = true
                                                        } label: {
                                                            Image(systemName: "camera")
                                                                .resizable()
                                                                .frame(width: 15, height: 15)
                                                                .foregroundColor(.white)
                                                                .padding(15)
                                                                .background(Color.green)
                                                                .clipShape(Circle())
                                                                .overlay(Circle().stroke( Color.white, lineWidth: 3))
                                                        }
                                                    }
                                                    Spacer()
                                                        .frame(height: 100)
                    
                                                }
                                            }
        
                                            
                                            VStack{
                                                Spacer()
                                                    .frame(height: 25)
                                                HStack{
                                                    Spacer()
                                                        .frame(width: 30)
                                                    Text("Full Name: ")
                                                        .bold()
                                                    Spacer()
                                                    Text("Dheeraj Vislawath")
                                                        .padding()
                                                        .frame(width: 200, height: 40)
                                                        .background(Color.black.opacity(0.07))
                                                        .cornerRadius(10)
                                                        .disabled(true)
                                                    
                                                    Spacer()
                                                        .frame(width: 30)
                                                }
                                                Spacer()
                                                    .frame(height: 15)
                                                HStack{
                                                    Spacer()
                                                        .frame(width: 30)
                                                    Text("Date of Birth: ")
                                                        .bold()
                                                    Spacer()
                                                    Text("09/12/2005")
                                                        .padding()
                                                        .frame(width: 200, height: 40)
                                                        .background(Color.black.opacity(0.07))
                                                        .cornerRadius(10)
                                                    
                                                    Spacer()
                                                        .frame(width: 30)
                                                    
                                                }
                                                Spacer()
                                                    .frame(height: 15)
                                                HStack{
                                                    Spacer()
                                                        .frame(width: 30)
                                                    Text("School: ")
                                                        .bold()
                                                    Spacer()
                                                    Text("Hillcrest Highschool")
                                                        .padding()
                                                        .frame(width: 200, height: 40)
                                                        .background(Color.black.opacity(0.07))
                                                        .cornerRadius(10)
                                                    
                                                    Spacer()
                                                        .frame(width: 30)
                                                }
                                                Spacer()
                                                    .frame(height: 15)
                                            }
                                            HStack{
                                                Spacer()
                                                    .frame(width: 30)
                                                Text("Grade: ")
                                                    .bold()
                                                Spacer()
                                                Text("12th Grade")
                                                    .padding()
                                                    .frame(width: 200, height: 40)
                                                    .background(Color.black.opacity(0.07))
                                                    .cornerRadius(10)
                                                
                                                Spacer()
                                                    .frame(width: 30)
                                            }
                                            Spacer()
                                                .frame(height: 15)
                                            HStack{
                                                Spacer()
                                                    .frame(width: 30)
                                                Text("Email: ")
                                                    .bold()
                                                Spacer()
                                                Text("dheerajv@gmail.com")
                                                    .padding()
                                                    .frame(width: 200, height: 40)
                                                    .background(Color.black.opacity(0.07))
                                                    .foregroundColor(Color.black)
                                                    .cornerRadius(10)
                                                
                                                Spacer()
                                                    .frame(width: 30)
                                            }
                                            Spacer()
                                                .frame(height: 60)
                                            
                                            // directs the user to a eddit profiel page
                                            Button("Edit User Profile Information")
                                            {
    //                                            toConfirmationView = true
                                            }
                                            .frame(width: 350, height: 50)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                            .foregroundColor(Color.white)
                                            Spacer()
                                                .frame(height: 10)
                                            VStack{
                                                Button("Report a Bug")
                                                {
                                                    showWebView.toggle()
                                                }
                                                .frame(width: 350, height: 50)
                                                .background(Color.blue)
                                                .cornerRadius(10)
                                                .foregroundColor(Color.white)
                                                .sheet(isPresented: $showWebView)
                                                {
                                                    WebView(url: URL(string: "https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D")!)
                                                }
                                                Spacer()
                                                    .frame(height: 10)
                                                Button("Logout")
                                                {
                                                    logout = true
                                                }
                                                .frame(width: 350, height: 50)
                                                .background(Color.blue)
                                                .cornerRadius(10)
                                                .foregroundColor(Color.white)
                                            }
                                            
                                    }
                                    }
                                }else{
                                    if #available(iOS 16.0, *) {
                                        if toStudentProfile == true
                                        {
                                            ProfileView(studentInfo: loadUserData()[0])
                                        }else if toConfirmationView == true && 0 == 1
                                        {
                                            AttendanceConfirmationView()
                                        }else
                                        {
                                            ScrollView
                                            {
                                                ZStack
                                                {
                                                    
                                                    VStack {
//                                                        Text("Attendance")
//                                                            .font(.title)
//                                                            .bold()
//                                                            .padding(30)
                                                        
                                                        Section(header: Text("Recent Attendance Entries")
                                                            .font(Font.title3)
                                                            .bold()
                                                            .padding(.bottom, 5)
                                                        )
                                                        {
                                                            VStack{
                                                                ZStack{
                                                                    Text("")
                                                                        .padding()
                                                                        .frame(width: 350, height: 40)
                                                                        .background(Color.black.opacity(0.07))
                                                                        .cornerRadius(2)
                                                                        .overlay(Rectangle().stroke( Color.black, lineWidth: 1).cornerRadius(5))
                                                                        
                                                                    HStack{
                                                                        Spacer()
                                                                            .frame(width: 300)
                                                                        Button{
                                                                            if(boxOneName == "chevron.up"){
                                                                                boxOneName = "chevron.down"
                                                                            }else{
                                                                                boxOneName = "chevron.up"
                                                                            }
                                                                            
                                                                        } label: {
                                                                            Image(systemName: "\(boxOneName)")
                                                                              .resizable()
                                                                              .scaleEffect(0.24)
                                                                              .foregroundColor(Color.black)
                                                                        }
                                                                    }
                                                                    
                                                                }
                                                                
                                                            }
                                                            .frame(maxHeight: 50)
                                                            .padding(.bottom, 5)
                                                            if(boxOneName == "chevron.down"){
                                                                ScrollView{
                                                                    VStack{
                                                                        Spacer()
                                                                        HStack{
                                                                            Spacer()
                                                                                .frame(width: 10)
                                                                            Text("Absences: ")
                                                                            Spacer()
                                                                        }
                                                                        Spacer()
                                                                        HStack{
                                                                            Spacer()
                                                                                .frame(width: 10)
                                                                            Text("Absent Periods: ")
                                                                            Spacer()
                                                                        }
                                                                        Spacer()
                                                                        HStack{
                                                                            Spacer()
                                                                                .frame(width: 10)
                                                                            Text("Tardies: ")
                                                                            Spacer()
                                                                        }
                                                                        Spacer()
                                                                        HStack{
                                                                            Spacer()
                                                                                .frame(width: 10)
                                                                            Text("Tardie Periods: ")
                                                                            Spacer()
                                                                        }
                                                                        Spacer()
                                                                    }
                                                                    .frame(width: 350, height: 200)
                                                                }
                                                                .background(Color.black.opacity(0.05))
                                                                .frame(width: 350, height: 200)
                                                                .cornerRadius(5)
                                                                
                                                            }

                                                            if (toConfirmationView)
                                                            {
                                                                Text("ATTENDANCE REQUEST |  \(selectedStartDate): \(reasonForAttendance)")
                                                                    .padding(.bottom, 5)
                                                            }
                                                            
                                                            Spacer()
                                                                .frame(height: 20)
                                                            
                                                            Section(header: Text("Enter Attendance Data")
                                                                .font(Font.title3)
                                                                .bold()
//                                                                .padding()
                                                            )
                                                            {
                                                                //                                Text("Enter Attendance")
                                                                //                                    .font(.largeTitle)
                                                                //                                    .bold()
                                                                DatePicker("Select start date:", selection: $selectedStartDate, displayedComponents: [.date])
                                                                    .padding(.leading)
                                                                    .padding(.horizontal, 40)
                                                                DatePicker("Select end date:", selection: $selectedEndDate, displayedComponents: [.date])
                                                                    .padding(.leading)
                                                                    .padding(.horizontal, 40)
//                                                                Text("Details:")
//                                                                    .font(.title3)
//                                                                    .padding()
                                                                Spacer()
                                                                    .frame(height: 30)
                                                                TextField("Reason for Absence or Tardy", text: $reasonForAttendance)
                                                                    .padding()
                                                                    .frame(width: 350, height: 50)
                                                                    .background(Color.black.opacity(0.07))
                                                                    .cornerRadius(10)
                                                                Spacer()
                                                                    .frame(height: 10)
                                                                Button("Update Attendance")
                                                                {
                                                                    toConfirmationView = true
                                                                }
                                                                .foregroundColor(.white)
                                                                .frame(width: 350, height: 50)
                                                                .background(Color.blue)
                                                                .cornerRadius(10)
                                                                Spacer()
                                                                    .frame(height: 30)
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                                
                                                .navigationBarBackButtonHidden(true)
                                                .navigationBarHidden(true)
                                            }
                                            //            .navigationBarBackButtonHidden()
                                        }
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(studentInfo: loadUserData()[0])
    }
}
