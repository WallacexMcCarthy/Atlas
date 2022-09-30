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
                    
                    MapView(with: loadMapData()[0])
                        .tabItem
                        {
                            Image(systemName: "mappin.circle")
                            Text("Map")
                        }
                    
                    SocialView()
                         .tabItem
                         {
                             Image(systemName: "text.bubble.fill")
                             Text("Social")
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
            .accentColor(.red) // highlights the icon red if clicked.
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
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
