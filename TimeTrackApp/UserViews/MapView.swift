//
//  MapView.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/20/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var impact : Maps
    var body: some View
    {
        VStack {
            Text(impact.title)
            Map(coordinateRegion: $impact.location)
                .frame(height: 400)
            Text(impact.details)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(impact: loadMapData()[0])
    }
}
