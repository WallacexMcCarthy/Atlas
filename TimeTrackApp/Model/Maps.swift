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
    var location: MKCoordinateRegion
    
}
