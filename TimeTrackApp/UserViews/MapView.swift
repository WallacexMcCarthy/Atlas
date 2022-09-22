//
//  MapView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/21/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var impact : Maps
    var body: some View
    {
        NavigationView {
            ZStack {
                VStack {
                    Map(coordinateRegion: $impact.regions)
                        .frame(height: 960)
//                    {
//                    
//                        MapMarker(coordinate: impact.location, tint: Color.blue)
//                    }
                    
                }
            }
            .navigationTitle("Maps")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(impact: loadMapData()[0])
    }
}
