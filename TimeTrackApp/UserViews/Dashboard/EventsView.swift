//
//  EventsView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/21/22.
//

import SwiftUI
import MapKit
import SDWebImageSwiftUI

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
                                .frame(width: 370, height: 340)
                                .cornerRadius(20)
                                .foregroundColor(Color.blue.opacity(0.50))                        .shadow(color: .blue, radius: 5, x : 0, y : 5)
                            VStack{
                                VStack{
                                    WebImage(url: URL(string: "https://image.maxpreps.io/qxcommentary/1/d/e/1deedf4e-b023-4b37-862a-39f2b81ade23_22222157_original.jpg?width=618&height=463&fit=bounds"))
                                        .resizable()
                                        .scaledToFit()
                                        .ignoresSafeArea()
                                        .padding(.horizontal, 15)
                                }
                                HStack {
                                    Text(impact.title)
                                        .ignoresSafeArea()
    //                                    .font(.caption2)
                                        .foregroundColor(Color.white)
                                    Spacer()
                                        .frame(width: 20)
                                    Text("\(impact.date.formatted())")
                                        .ignoresSafeArea()
//                                        .font(.caption2)
                                        .foregroundColor(Color.white)
                                }

                                Text(impact.details)
                                    .ignoresSafeArea()
//                                    .font(.caption2)
                                    .foregroundColor(Color.white)
                            }
                        }
                        Spacer()
                            .frame(height: 20)
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
