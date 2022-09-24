//
//  DashboardView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI


struct DashboardView: View
{
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
                VStack
                {
                    Form
                    {
                        Section(header: Text("Announcements"))
                        {
                            Text(" Date: \(announcements[0].date) \n Details: \(announcements[0].announcement) \n Type: \(announcements[0].type)")
                            Text(" Date: \(announcements[1].date) \n Details: \(announcements[1].announcement) \n Type: \(announcements[1].type)")
                            Text(" Date: \(announcements[2].date) \n Details: \(announcements[2].announcement) \n Type: \(announcements[2].type)")
                        }
                    }
                    Form
                    {
                        Section(header: Text("Upcoming Events"))
                        {
                            ForEach(impacts.indices)
                            {
                                index in
                                
                                NavigationLink(impacts[index].title, destination: EventsView(with:loadMapData()[indexs]))
                                
                                
    //                            Button(impacts[index].title)
    //                            {
    //                                toMaps = true
    //                                indexs = index
    //                            }
                            }
                        }
                }
                    .ignoresSafeArea(.all)
                }
                
                
                
                //            ScrollView
                //            {
                //                List
                //                {
                //                    Section(header: Text("Upcoming Events"))
                //                    {
                //                        Text("Hello")
                //                    }
                //                }
                //                    .border(Color.yellow, width: 3)
                //                    .background(Color.blue)
                //
                
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
