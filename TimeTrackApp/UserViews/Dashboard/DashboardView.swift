//
//  DashboardView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI
var buttonIndex = 4;
var announcementsCount = loadAnnouncementData().count - 1
var textsss = "hello"


struct DashboardView: View
{
    var posts: [Post] = [
            Post(id: 0, userName: "wallace@gmail.com", text: "Body of post 0", profileImageName: "Twitter_Icon", imageName: "0 - Canyons Rank"),
            Post(id: 1, userName: "science@gmail.com", text: "Body of post 1", profileImageName: "Google_Icon", imageName: "1 - Canyons Safe"),
            Post(id: 2, userName: "biology@gmail.com", text: "Body of post 2", profileImageName: "Apple_ID_Icon", imageName: "2 - CSD")
        ]
    @State var start = Date()
    @StateObject var updaterViewModel = UpdaterViewModel()
    let timer = Timer.publish(every: 10.0, on: .main, in: .common).autoconnect()
    let userData = loadUserData()
    let currentUserData = loadCurrentUserData()
    let impacts = loadMapData()
    let announcements = loadAnnouncementData()
    @State var selectedDated: Date = Date()
    @State private var toMaps = false
    @State private var toEvent = false
    @State private var indexs = 0
    @State private var linesLimit = 5
    @State private var seeMoreActive = false;
    @State private var readMoreText = "Read More"
    @State private var newPost = false
    @State private var newPostBodyText = ""
    @State private var newPostTitleText = ""
    
    @State var imageSelectedOne = UIImage()
    @State var newImagePickerOne = false
    @State var changeProfileIamge = false
    @State var openCameraRoll = false
    
    var body: some View {
        NavigationView
        {
            if toEvent
            {
//                EventsView(load)
            }else if toMaps
            {
                EventsView(with:loadMapData()[indexs])
            }else
            {
                
                GeometryReader { geometry in
                    ScrollView() {
                        VStack
                        {
                            VStack{
                                HStack{
                                    Text("Dashboard")
                                        .font(.largeTitle)
                                        .bold()
                                    Spacer()
                                        .frame(width: 140)
                                }
                                HStack{
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 370, height: 320)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.blue.opacity(0.50))                                                          .shadow(color: .blue, radius: 5, x : 0, y : 5)
                                        VStack{
                                            Image(announcements[buttonIndex].immageLinkSource)
                                                .resizable()
                                                .scaledToFit()
                                                .background(Color("Beige").opacity(0.8))
                                                .ignoresSafeArea()
                                                .padding(.horizontal, 20)
                                            //                                                                .cornerRadius(70)
                                            Text("Copyright © 2023- All Rights Reserved")
                                                .ignoresSafeArea()
                                                .font(.caption2)
                                                .foregroundColor(Color.white)
                                            Text(announcements[buttonIndex].title)
                                                .frame(width: 330, height: 80)
                                                .padding(.horizontal, 30)
                                                .cornerRadius(10)
                                                .font(.title3)
                                                .ignoresSafeArea()
                                                .foregroundColor(Color.white)
                                            
                                            
                                        }
                                        
                                        }
                                        
                                    }
                                VStack{
                                    Spacer()
                                        .frame(height: 30)
                                    Text(announcements[buttonIndex].announcment)
                                        .frame(width: 330)
                                        .padding(.horizontal, 30)
                                        .cornerRadius(10)
                                        .ignoresSafeArea()
                                        .lineLimit(linesLimit)
                                    Button{
                                        if(seeMoreActive == true){
                                            seeMoreActive = false
                                            linesLimit = 5
                                            readMoreText = "Read Less"
                                        }else{
                                            seeMoreActive = true
                                            linesLimit = 50
                                            readMoreText = "Read More"
                                        }
                                        
                                    }label: {
                                        Text("\(readMoreText)")
                                    }
                                    Button{
                                        newPost.toggle()
                                    }label: {
                                        VStack {
                                            HStack {
                                                Spacer()
                                                Text(" + New Post             ")
                                                    .font(.system(size: 16, weight: .bold))
                                                Spacer()
                                            }
                                            .foregroundColor(.white)
                                            .padding(.vertical)
                                            .background(Color.blue)
                                            .cornerRadius(32)
                                            //            .frame(width: 150, height: 100)
                                            .padding(.horizontal)
                                            .shadow(radius: 15)
                                            
                                            Spacer()
                                                .frame(height: 30)
                                        }
                                    }
                                    if(newPost){
                                        VStack(alignment: .leading, spacing: 8) {
                                            Button{
                                                // image Picker
                                                changeProfileIamge = true
                                                                                       openCameraRoll = true
                                            } label: {
                                                if(changeProfileIamge)
                                                {
                                                    Image(uiImage: imageSelectedOne)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: geometry.size.width, height: 250)
                                                        .clipped()
                                                }else{
                                                    Image(systemName: "camera")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: geometry.size.width, height: 250)
                                                        .clipped()
                                                }
                                            }
                                            
                                            TextField("Caption", text: $newPostBodyText)
                                                .lineLimit(nil)
                                                .font(.system(size: 15))
                                                .padding(.leading, 16).padding(.trailing, 16).padding(.bottom, 16)
                                                .background(Color.black.opacity(0.05))
                                            Button{
//                                                posts.append(Post(id: 3, userName: "wallace@gmail.com", text: newPostBodyText, profileImageName: "Twitter_Icon", imageName: "Twitter_Icon"))
                                            }label:{
                                                Spacer()
                                                Text(" Post             ")
                                                    .font(.system(size: 16, weight: .bold))
                                                Spacer()                                            }
                                            
                                        }.listRowInsets(EdgeInsets())
                                    }
                                    ForEach(self.posts, id: \.id) {(post) in
                                        PostView(post: post,screenWidth: geometry.size.width)
                                    }
                                    
                                }
                                .sheet(isPresented: $openCameraRoll)
                                {
                                    ImagePicker(selectedImage: $imageSelectedOne, sourceType: .photoLibrary)
                                    
                                }
                            }
                            .onReceive(timer, perform: {
                                _ in
                                if(buttonIndex <= 0)
                                {
                                    buttonIndex = announcementsCount
                                }else
                                {
                                    buttonIndex = buttonIndex - 1
                                }
                                
                                
                            })
                            
                        }
                    }
                    .background(Color.black.opacity(0.05))
                    
                }
                
            }
            
        }
        
    }
}
class UpdaterViewModel: ObservableObject {
    @Published var index: Int = 0
    @Published var now: Date = Date()

    var timer: Timer?
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.refresh()
        })
    }
    deinit {
        timer?.invalidate()
    }
    func refresh() {
        index += 1
        now = Date()
    }
}


    struct DashboardView_Previews: PreviewProvider {
        static var previews: some View {
            Group{
                DashboardView()
            }
        }
}
