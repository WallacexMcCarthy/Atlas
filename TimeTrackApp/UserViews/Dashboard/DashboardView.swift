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
    @State private var linesLimit = 10
    
    
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
                
                ScrollView() {
                    VStack
                    {
                        
                        
                        VStack{
                            Text("Announcements")
                                .font(.largeTitle)
                                .bold()
                            HStack{
                                ZStack{
                                    Rectangle()
                                        .frame(width: 370, height: 320)
                                        .cornerRadius(20)
                                        .foregroundColor(Color.blue.opacity(0.32))                                                          .shadow(color: .blue, radius: 5, x : 0, y : 5)
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
                                        Text(announcements[buttonIndex].title)
                                            .frame(width: 330, height: 80)
                                            .padding(.horizontal, 30)
                                            .cornerRadius(10)
                                            .font(.title3)
                                            .ignoresSafeArea()
                                        
                                        
                                    }
                                    
                                    }
                                    
                                }
                            VStack{
                                Text(announcements[buttonIndex].announcment)
                                    .frame(width: 330)
                                    .padding(.horizontal, 30)
                                    .cornerRadius(10)
                                    .ignoresSafeArea()
                                    .lineLimit(50)
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
