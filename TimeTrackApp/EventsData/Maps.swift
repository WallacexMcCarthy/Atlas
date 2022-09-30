//
//  Maps.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/20/22.
//

import MapKit

/* craates all fo the variabels taht will be used in the array, simmilar to a database.
 I am currently trying to impliemnt Core Data or SQLite to remove the rudendancies of these files and data.
 */

struct Maps : Identifiable
{
    // creates a origional id every time every time it is used / called
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
