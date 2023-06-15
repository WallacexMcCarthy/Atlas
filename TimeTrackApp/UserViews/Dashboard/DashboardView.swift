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
    @State var selectedDate: Date = Date()
    @State private var buttonIndex = 4
    @State private var toMaps = false
    @State private var toEvent = false
    @State private var indexs = 0
    var body: some View {
        NavigationView
        {
            if toEvent
            {
                EventsView(with:loadEvent(date: selectedDate))
            }else if toMaps
            {
                EventsView(with:loadMapData()[indexs])
            }else
            {
                ZStack
                {
                    Color("Beige")
                        .ignoresSafeArea()
                    
                    VStack
                    {
                        
                        ScrollView
                        {
                            
                            VStack() {
                                
                                Divider().frame(height: 1)
                                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                    .padding(.horizontal)
                                    .datePickerStyle(.graphical)
//                                    .onTapGesture(perform: {
//                                        DispatchQueue.main
//                                            .asyncAfter(deadline: .now() + 0.2)
//                                        {
//                                            toEvent = true
//                                        }
//                                    })
                                Divider()
                                Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                                    .font(.system(size: 28))
                                    .bold()
                                    .foregroundColor(Color.accentColor)
                                    .padding()
                                    .animation(.spring(), value: selectedDate)
                                    .frame(width: 500)
//                                    .onChange( of: selectedDate, perform: {toEvent = true})
                                    
                                NavigationLink(selectedDate.formatted(date: .abbreviated, time: .omitted), destination: EventsView(with:loadEvent(date: selectedDate)))                            }
                            .padding(.vertical, 100)
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
                                            .bold()
                                        Image(announcements[buttonIndex].immageLinkSource)
                                            .resizable()
                                            .frame(width: 375, height: 200)
                                            .background(Color("Beige").opacity(0.8))
                                            .ignoresSafeArea()
                                            .padding(.horizontal, 20)
                                        
                                            Text("Copyright © 2023- All Rights Reserved")
                                                .ignoresSafeArea()
                                                .font(.caption2)
                                        Text(announcements[buttonIndex].title)
                                            .frame(width: 330, height: 80)
                                            .padding(.horizontal, 30)
                                            .cornerRadius(10)
                                            .font(.title3)
                                            .background(Color("Beige").opacity(0.8))
                                            .ignoresSafeArea()
                                            
                                        Text(announcements[buttonIndex].announcment)
                                            .frame(width: 330, height: 300)
                                            .padding(.horizontal, 30)
                                            .cornerRadius(10)
                                            .background(Color("Beige").opacity(0.8))
                                            .ignoresSafeArea()
                                            .lineLimit(nil)
                                        Section(header: Text("Upcoming Events").font(.title).frame(width: 400, height: 50).background(Color("Beige").opacity(0.8)))
                                        {
                                            ForEach(impacts.indices)
                                            {
                                                index in
                                                
                                                NavigationLink("\(impacts[index].title)", destination: EventsView(with:loadMapData()[index]))
                                                    .frame(width: 330, height: 50)
                                                    .background(Color("Clay"))
                                                    .cornerRadius(20)
                                                    .foregroundColor(Color("DarkBlue"))
                                            }
                                        }
                                        
                                        

                                    }
                                }
                            
//                            }
                            
                            
                            
                            
                        }
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
                                .foregroundColor(Color("DarkBlue"))
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
                                .foregroundColor(Color("DarkBlue"))
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
    /**
     This function is used to pass the index of the event to the EventsView
     */
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
