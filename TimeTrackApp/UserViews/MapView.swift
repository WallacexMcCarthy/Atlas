//
//  MapView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/21/22.
//

import SwiftUI
import MapKit


/*
 Creates a map with all of the events shown as pins as well as the current location of the user.
 */

struct MapView: View {
    @State var impact : Maps
    @State var mapsData = loadMapData()
    public var mapItems : [Maps]
    init (with impact: Maps)
    {
        _impact = State(initialValue: impact)
        self.mapItems = [currentLocation, impact]
    }
    var body: some View
    {
        NavigationView {
            ZStack {
                VStack {

                    Map(coordinateRegion: $impact.regions, annotationItems: mapItems)
                    {
                        pin in
                        MapMarker(coordinate: pin.location, tint: Color.cyan)
                        
                    }
                        .frame(height: 960)
                        
                    
                    
                    
                }
            }
            .navigationTitle("Maps")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(with: loadMapData()[0])
    }
}
