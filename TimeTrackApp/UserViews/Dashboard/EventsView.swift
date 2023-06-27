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
    @State private var toEvents: Bool = false
    public var mapItems : [Maps]
    init (with impact: Maps)
    {
        _impact = State(initialValue: impact)
        self.mapItems = [currentLocation, impact]
    }
    var body: some View
    {
        NavigationView {
            if toEvents
            {
                DashboardView()
            }else
            {
                ZStack
                {
                    VStack {
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 370, height: 320)
                                .cornerRadius(20)
                                .foregroundColor(Color.blue.opacity(0.50))                        .shadow(color: .blue, radius: 5, x : 0, y : 5)
                            VStack{
                                Image(systemName: "camera")
                                    .resizable()
                                    .frame(width: 200, height: 150)
                                    .ignoresSafeArea()
                                    .padding(.horizontal, 20)
                                Text(impact.title)
                                    .ignoresSafeArea()
                                    .font(.caption2)
                                    .foregroundColor(Color.white)
                                Text("\(impact.date.formatted())")
                                    .ignoresSafeArea()
                                    .font(.caption2)
                                    .foregroundColor(Color.white)
                                Text(impact.details)
                                    .ignoresSafeArea()
                                    .font(.caption2)
                                    .foregroundColor(Color.white)
                            }
                        }
                        // creates the map and calls the event region.
                        Map(coordinateRegion: $impact.regions, annotationItems: mapItems)
                        {
                            pin in
                            // fix ****************************************
                            MapMarker(coordinate: pin.regions.center, tint: Color.red.opacity(0.8))
                        }
                            .frame(height: 400)
                            .ignoresSafeArea(.all)
                                                                    }
                }
//                .navigationTitle("Event Map")
            }
            
        }
    }
    
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(with: loadMapData()[0])
    }
}
