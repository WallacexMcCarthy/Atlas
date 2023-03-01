//
//  EventsView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/21/22.
//

import SwiftUI
import MapKit

/*
 Shows the event thatwas clicked on in Dashboard View and it will display its coordiantes on a map as well as a little informatiomn about the event. 
 */

struct EventsView: View {
    @State var impact : Maps
    @State private var toDashboard: Bool = false
    public var mapItems : [Maps]
    init (with impact: Maps)
    {
        _impact = State(initialValue: impact)
        self.mapItems = [currentLocation, impact]
    }
    var body: some View
    {
        NavigationView {
            if toDashboard
            {
                DashboardView()
            }else
            {
                ZStack
                {
                    
                    VStack {
                        
                        
                        Text(impact.title)
                        Text("\(impact.month)/\(impact.day)/\(impact.year)")
                        Text(impact.details)
                        // creates the map and calls the event region.
                        Map(coordinateRegion: $impact.regions, annotationItems: mapItems)
                        {
                            pin in
                            // fix ****************************************
                            MapMarker(coordinate: pin.regions.center, tint: Color.red.opacity(0.8))
                        }
                            .frame(height: 600)
                            .ignoresSafeArea(.all)
                        
                        Button("Back to Dashboard")
                        {
                            toDashboard = true
                        }
                        .frame(width: 300, height: 50)
                        .background(Color.blue.opacity(0.15))
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                        .ignoresSafeArea()
    //                    {
    //
    //                        MapMarker(coordinate: impact.location, tint: Color.blue)
    //                    }
                                            }
                }
//                .navigationTitle("Event Map")
            }
            
        }
        .navigationBarHidden(true)
    }
    
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(with: loadMapData()[0])
    }
}
