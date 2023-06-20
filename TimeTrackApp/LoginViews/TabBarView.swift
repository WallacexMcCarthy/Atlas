//
//  HomeView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct TabBarView: View
{
    var body: some View
    {
        ZStack
        {
            VStack
            {
                TabView
                    {
                        // creates a tab bar on the bottom of the screen that allows the user to click on differnt icons and those icons will direct the user to differnt views/ pages.
                        DashboardView()
                            .tabItem
                            {
                                //Image("icon")
                                Image(systemName: "house")
                                Text("Dashboard")
                            }
                        
                        MainMessagesView()
                            .tabItem
                            {
                                Image(systemName: "person.3.fill")
                                Text("Social")
                            }
                        
                        SocialView()
                             .tabItem
                             {
                                 Image(systemName: "text.bubble.fill")
                                 Text("Help Desk")
                             }
                        
                        SchoolInfoView()
                             .tabItem
                             {
                                 Image(systemName: "info.circle.fill")
                                 Text("School Info")
                             }
                        
                        AttendanceView()
                             .tabItem
                             {
                                 Image(systemName: "person.badge.clock")
                                 Text("Attendance")
                             }

                        
                    }
                    .background(Color.white)
                .accentColor(.red) // highlights the icon red if clicked.
                .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TabBarView()
    }
}
