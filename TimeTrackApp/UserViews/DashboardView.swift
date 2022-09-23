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
