//
//  EventsView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/21/22.
//

import SwiftUI
import MapKit

struct EventsView: View {
    @State var impact : Maps
    @State private var toDashboard: Bool = false
    var body: some View
    {
        NavigationView {
            if toDashboard
            {
                UpcomingEventsView()
            }else
            {
                ZStack {
                    VStack {
                        Button("Back to Dashboard")
                        {
                            toDashboard = true
                        }
                        Text(impact.title)
                        Text("\(impact.month)/\(impact.day)/\(impact.year)")
                        Map(coordinateRegion: $impact.regions)
                            .frame(height: 400)
    //                    {
    //
    //                        MapMarker(coordinate: impact.location, tint: Color.blue)
    //                    }
                        Text(impact.details)
                    }
                }
    //            .navigationTitle("Event Map")
            }
            
        }
        .navigationBarHidden(true)
    }
    
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(impact: loadMapData()[0])
    }
}
