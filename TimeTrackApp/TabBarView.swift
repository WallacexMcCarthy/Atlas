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
        TabView
            {
                DashboardView()
                    .tabItem
                    {
                        //Image("icon")
                        Image(systemName: "house")
                        Text("Dashboard")
                    }

               UpcomingEventsView()
                    .tabItem
                    {
                        Image(systemName: "calendar")
                        Text("Upcoming Events")
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
        .accentColor(.red)
    }
}

struct HomeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TabBarView()
    }
}
