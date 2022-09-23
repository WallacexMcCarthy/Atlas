//
//  Maps.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/20/22.
//

import MapKit

struct Maps : Identifiable
{
    let id = UUID()      
    let title: String
    let details: String
    let year: Int
    let month: Int
    let day: Int
    let address: String
    var location: CLLocationCoordinate2D
    var regions: MKCoordinateRegion
    
}
