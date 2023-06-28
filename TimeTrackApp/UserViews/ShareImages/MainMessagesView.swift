//
//  PicturesView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 2/25/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import SDWebImageSwiftUI

        
class MainMessagesViewModel: ObservableObject {
    @State private var toSocialView = true
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    @Published var isUserCurrentlyLoggedOut = false
    
    init() {
        
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        
        fetchCurrentUser()
    
        fetchRecentMessages()
    }
    
    @Published var recentMessages = [RecentMessage]()
    
    func fetchRecentMessages() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        self.recentMessages.removeAll()
        
        FirebaseManager.shared.firestore
            .collection("recent_messages")
            .document(uid)
            .collection("messages")
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for recent messages: \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    let docId = change.document.documentID
                    
                    if let index = self.recentMessages.firstIndex(where: { rm in
                        return rm.id == docId
                    }) {
                        self.recentMessages.remove(at: index)
                    }
                    
                    do {
                        if let rm = try? change.document.data(as: RecentMessage.self) {
                            self.recentMessages.insert(rm, at: 0)
                        }
                    } catch {
                        print(error)
                    }
                    
//                    self.recentMessages.insert(.init(documentId: docId, data: change.document.data()), at: 0)
                })
            }
    }
    
    func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
                
            }
            
            self.chatUser = .init(data: data)
        }
    }
}
    

struct MainMessagesView: View {
    
    @State var shouldShowLogOutOptions = false
    
    @State var shouldNavigateToChatLogView = false
    @State var shouldNavigateToAIChatLogView = false
    
    @ObservedObject var vm = MainMessagesViewModel()
    
    private var customNavBar: some View {
        VStack{
            HStack(spacing: 16) {
                WebImage(url: URL(string: "https://captainkimo.s3.amazonaws.com/wp-content/uploads/2015/01/Sunset-Jupiter-Lighthouse-from-Dubois-Park.jpg"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(50)
                                .overlay(RoundedRectangle(cornerRadius: 44)
                                            .stroke(Color(.label), lineWidth: 1)
                                )
                                .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Dheeraj Vislawath")
                        .font(.system(size: 24, weight: .bold))
                    
                    HStack {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 14, height: 14)
                        Text("online")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.lightGray))
                    }
                    
                }
                
                Spacer()
            }
            .padding()
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                    .destructive(Text("Sign Out"), action: {
                        print("handle sign out")
                    }),
                    .cancel()
                ])
            }
        }
    }
    private var chatLogViewModel = ChatLogViewModel(chatUser: nil)
     
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Messages")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                        .frame(width: 180)
                }
                NavigationLink("", isActive: $shouldNavigateToChatLogView) {
//                    ChatLogView(chatUser: self.chatUser)
                    ChatLogView(vm: chatLogViewModel)
                }
                NavigationLink("", isActive: $shouldNavigateToAIChatLogView) {
                    SocialView()
                }
                customNavBar
                messagesView
            }
            .overlay(
                newMessageButton, alignment: .bottom)
            .navigationBarHidden(true)
        }
    }
    
    private var messagesView: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 7)
                    Button {
                        shouldNavigateToAIChatLogView.toggle()
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: "https://t3.ftcdn.net/jpg/03/22/38/32/360_F_322383277_xcXz1I9vOFtdk7plhsRQyjODj08iNSwB.jpg"))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                            .clipped()
                                            .cornerRadius(50)
                                            .overlay(RoundedRectangle(cornerRadius: 44)
                                                        .stroke(Color(.label), lineWidth: 1)
                                            )
                                            .shadow(radius: 5)
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("AI Assistant")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(.label))
                                    .multilineTextAlignment(.leading)
                                Text("Welcome to the Help Desk")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.lightGray))
                            }
                            Spacer()
                            
                            Text("")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(.label))
                        }
                    }
                    Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)
                
                ForEach(vm.recentMessages) { recentMessage in
                    VStack {
                        Button {
                            
                            let uid = FirebaseManager.shared.auth.currentUser?.uid == recentMessage.fromId ? recentMessage.toId : recentMessage.fromId
                            self.chatUser = .init(data: [FirebaseConstants.email: recentMessage.email, FirebaseConstants.uid: uid, FirebaseConstants.profileImageUrl: recentMessage.profileImageUrl])
                            self.chatLogViewModel.chatUser = self.chatUser
                            self.chatLogViewModel.fetchMessages()
                            self.shouldNavigateToChatLogView.toggle()
                        } label: {
                            HStack {
                                WebImage(url: URL(string: recentMessage.profileImageUrl))
                                                                .resizable()
                                                                .scaledToFill()
                                                                .frame(width: 50, height: 50)
                                                                .clipped()
                                                                .cornerRadius(50)
                                                                .overlay(RoundedRectangle(cornerRadius: 50)
                                                                            .stroke(Color(.label), lineWidth: 2)
                                                                )
                                
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(recentMessage.email)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(Color(.label))
                                        .multilineTextAlignment(.leading)
                                    Text(recentMessage.text)
                                        .font(.system(size: 14))
                                        .foregroundColor(Color(.lightGray))
                                }
                                Spacer()
                                
                                Text(recentMessage.timeAgo)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(Color(.label))
                            }
                        }
                        Divider()
                            .padding(.vertical, 8)
                    }.padding(.horizontal)
                    
                }
            }
        }
    }
    
    @State var shouldShowNewMessageScreen = false
    
    private var newMessageButton: some View {
        Button {
            shouldShowNewMessageScreen.toggle()
        } label: {
            VStack {
                HStack {
                    Spacer()
                    Text(" + New Message             ")
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
                    .frame(height: 15)
            }
        }
        .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
            CreateNewMessagesView(didSelectNewUser: { user in
                print(user.email)
//                self.vm.fetchRecentMessages()
                self.shouldNavigateToChatLogView.toggle()
                self.chatUser = user
                self.chatLogViewModel.chatUser = user
//                self.chatLogViewModel.fetchMessages()
            })

        }
    }
    
    @State var chatUser: ChatUser?
}

struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
    
        MainMessagesView()
    }
}
