//
//  UpcomingEventsView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI
/*
 I am no longer using this View but i am saving it just in case i need it later.
 */
struct UpcomingEventsView: View {
    let impacts = loadMapData()
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
                List
                {
                    /*
                     It creates a for loop that for every things in impacts whcih is just really loadMapsData, it will display a navigationLink that looks simmilar to a button and from this it will connect you to the respective event's maps page.
                     */
                    Section(header: Text("Upcoming Events"))
                    {
                        ForEach(impacts.indices)
                        {
                            index in
                            
                            Button(impacts[index].title)
                            {
                                toMaps = true
                                indexs = index
                            }
                        }
                    }
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

struct UpcomingEventsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingEventsView()
    }
}
