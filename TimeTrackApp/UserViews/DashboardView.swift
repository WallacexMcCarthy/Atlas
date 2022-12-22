//
//  DashboardView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI


struct DashboardView: View
{
    let userData = loadCurrentUserData()
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
                        
                        Form
                        {
                            Section(header: Text("Welcome "))
                            {
                                
                            }
                        }
                        Form
                        {
                            
                            Section(header: Text("Announcements"))
                            {
                                /*
                                 Creates a loop where it calls the data file announcements which is loadAnnouncementData and for each element in announcements it displays text that shows the date, details and the type (Achedemic, sports etc).
                                 */
                                ForEach(announcements.indices)
                                {
                                    index in
                                    
                                    Text(" Date: \(announcements[index].date) \n Details: \(announcements[index].announcement) \n Type: \(announcements[index].type)")
                                    
                                }
                            }
                            
                        }
                        .padding(.vertical, 50)
    //                    Form
                        
    //                    {
    //                        Section(header: Text("Upcoming Events"))
    //                        {
    //                            /*
    //                             It creates a for loop that for every things in impacts whcih is just really loadMapsData, it will display a navigationLink that looks simmilar to a button and from this it will connect you to the respective event's maps page.
    //                             */
    //                            ForEach(impacts.indices)
    //                            {
    //                                index in
    //
    //                                NavigationLink(impacts[index].title, destination: EventsView(with:loadMapData()[indexs]))
    //
    //
    //                            }
    //                        }
    //                }
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
