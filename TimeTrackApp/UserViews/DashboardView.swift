//
//  DashboardView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI


struct DashboardView: View
{
    let userData = loadUserData()
    let currentUserData = loadCurrentUserData()
    let impacts = loadMapData()
    let announcements = loadAnnouncementData()
    @State private var toMaps = false
    @State private var indexs = 0
    var body: some View {
        NavigationView
        {
            
            if toMaps
            {
                EventsView(with:loadMapData()[indexs])
            }else
            {
                ZStack
                {
                    Color.gray.opacity(0.1)
                        .ignoresSafeArea()
                    VStack
                    {
                        
                        ScrollView
                        {
                            
                            
                            
//                            Section(header: Text("Announcements")
//                                .font(.largeTitle))
//
//                            {
                                ZStack
                                {
                                    /*
                                     Creates a loop where it calls the data file announcements which is loadAnnouncementData and for each element in announcements it displays text that shows the date, details and the type (Achedemic, sports etc).
                                     */
                                    VStack
                                    {
                                        Text(" ")
                                            .padding(5)
                                        Text(" Wellcome \(userData[currentUserIndexValue].fullName)")
                                            .font(.title3)
                                        Text("Announcements")
                                            .font(.largeTitle)
                                        ForEach(announcements.indices)
                                        {
                                            index in
                                            Image(announcements[index].immageLinkSource)
                                                .resizable()
                                                .frame(width: 400, height: 200)
                                            Text(announcements[index].title)
                                                .frame(width: 390)
                                                .padding(.horizontal, 10)
                                                .padding(15)
                                                .cornerRadius(10)
                                            Text(announcements[index].announcment)
                                                .frame(width: 360)
                                                .padding(.horizontal, 10)
                                                .padding(15)
                                                .cornerRadius(10)
                                            
                                            
                                            
                                    }
                                        Text(" ")
                                            .padding(30)
                                        
                                    }
                                }
//                            }
                            
                            
                        }
                        .background(Color.blue.opacity(0.15))
                        .ignoresSafeArea(.all)
                }
                }
                
                
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
