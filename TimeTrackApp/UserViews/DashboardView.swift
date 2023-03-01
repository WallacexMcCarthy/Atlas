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
    @State private var buttonIndex = 0
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
                    Color.blue.opacity(0.1)
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
//                                        Text(" Wellcome \(userData[currentUserIndexValue].fullName)")
//                                            .font(.title3)
                                        Text("Announcements")
                                            .font(.largeTitle)
                                        Image(announcements[buttonIndex].immageLinkSource)
                                            .resizable()
                                            .frame(width: 400, height: 200)
                                            .background(Color.blue.opacity(0.8))
                                            .ignoresSafeArea()
                                            .padding(.horizontal, 20)
                                        Text(announcements[buttonIndex].title)
                                            .frame(width: 330, height: 80)
                                            .padding(.horizontal, 30)
                                            .cornerRadius(10)
                                            .font(.title3)
                                            .background(Color.blue.opacity(0.1))
                                            .ignoresSafeArea()
                                            
                                        Text(announcements[buttonIndex].announcment)
                                            .frame(width: 330, height: 300)
                                            .padding(.horizontal, 30)
                                            .cornerRadius(10)
                                            .background(Color.blue.opacity(0.1))
                                            .ignoresSafeArea()
                                            .lineLimit(nil)
                                        Section(header: Text("Upcoming Events").font(.title).frame(width: 400, height: 50).background(Color.white.opacity(0.2)))
                                        {
                                            ForEach(impacts.indices)
                                            {
                                                index in
                                                
                                                NavigationLink("\(impacts[index].title)", destination: EventsView(with:loadMapData()[index]))
                                                    .frame(width: 330, height: 50)
                                                    .background(Color.blue.opacity(0.5))
                                                    .cornerRadius(20)
                                                    .foregroundColor(Color.black)
                                            }
                                        }
                                        
                                        

                                    }
                                }
                            
//                            }
                            
                            
                            
                            
                        }
                        .background(Color.blue.opacity(0.15))
                        .ignoresSafeArea(.all)
                }
                    ZStack
                    {
                        VStack
                        {
                            HStack
                            {
                                Button("<")
                                {
                                    if(buttonIndex <= 0)
                                    {
                                        buttonIndex = announcements.count - 1
                                    }else
                                    {
                                        buttonIndex = buttonIndex - 1
                                    }
                                }
                                .font(.title.bold())
                                .foregroundColor(Color.black.opacity(0.5))
                                .foregroundColor(.white)
                                .frame(width: 20, height: 595)
                                .background(Color.blue.opacity(0.0))
                                Spacer()
                                    .frame(width: 355)
                                Button(">")
                                {
                                    if(buttonIndex >= announcements.count - 1)
                                    {
                                        buttonIndex = 0
                                    }else
                                    {
                                        buttonIndex = buttonIndex + 1
                                    }
                                    
                                }
                                .font(.title.bold())
                                .foregroundColor(Color.black.opacity(0.5))
                                .foregroundColor(.white)
                                .frame(width: 20, height: 595)
                                .background(Color.blue.opacity(0.0))
                            }
                            Spacer()
                                .frame(height: 7)
                            
                            
                            
                        }
                        
                        
                    }
                }
            }
            
        }
    }
    func findIndex(index: Int)
    {
        indexs = index
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
