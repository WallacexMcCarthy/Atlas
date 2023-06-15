//
//  MapsData.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/20/22.
//

import MapKit


// our current location which is just the coordinates for Hillcrest Highschool.
let currentLocation = Maps(title: "Current Location", details: "This is the current location of the user", year: 2022, month: 9, day: 23, address: "7350 S 900 E, Midvale, UT 84047", location: CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020), regions: MKCoordinateRegion (center: CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020), span: (MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))), date: Date())

/*
 It calls the data file Maps and uses the variabels creeated there to make an array and it will return an array that has new information.
 */

func loadMapData() -> [Maps]
{
    // creates a new array that will be used to store the data.
    var mapsItems : [Maps] = []
    // creates a new array that will be used to store the data.
    let location : [CLLocationCoordinate2D] =
    [
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.32194000, longitude: -112.01753000),
        CLLocationCoordinate2D(latitude: 40.29781211, longitude: -111.73986780),
        CLLocationCoordinate2D(latitude: 40.81754675, longitude: -111.94798340),
        CLLocationCoordinate2D(latitude: 41.75252360, longitude: -111.81188890),
        CLLocationCoordinate2D(latitude: 40.52482413, longitude: -111.95950870),
        CLLocationCoordinate2D(latitude: 40.02821719, longitude: -111.73423380),
        CLLocationCoordinate2D(latitude: 40.64742095, longitude: -111.85250820),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -112.30723100),
        CLLocationCoordinate2D(latitude: 40.53011869, longitude: -111.84200550),
        CLLocationCoordinate2D(latitude: 40.76493678, longitude: -111.84200550),
        CLLocationCoordinate2D(latitude: 40.76493678, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -113.07125720),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -109.56493310),
        CLLocationCoordinate2D(latitude: 40.46457078, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -112.30304140),
        CLLocationCoordinate2D(latitude: 40.62582840, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.69151770),
        CLLocationCoordinate2D(latitude: 40.32285220, longitude: -111.46850600),
        CLLocationCoordinate2D(latitude: 40.67990548, longitude: -111.96209100),
        CLLocationCoordinate2D(latitude: 40.66121193, longitude: -112.03265780),
        CLLocationCoordinate2D(latitude: 41.17704593, longitude: -111.85490400),
        CLLocationCoordinate2D(latitude: 40.67723071, longitude: -111.85490400),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -113.07125720),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -113.07125720),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -113.07125720)
    ]
    // creates a new array that will be used to store the data.
    let regions : [CLLocationCoordinate2D] =
    [
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.32194000, longitude: -112.01753000),
        CLLocationCoordinate2D(latitude: 40.29781211, longitude: -111.73986780),
        CLLocationCoordinate2D(latitude: 40.81754675, longitude: -111.94798340),
        CLLocationCoordinate2D(latitude: 41.75252360, longitude: -111.81188890),
        CLLocationCoordinate2D(latitude: 40.52482413, longitude: -111.95950870),
        CLLocationCoordinate2D(latitude: 40.02821719, longitude: -111.73423380),
        CLLocationCoordinate2D(latitude: 40.64742095, longitude: -111.85250820),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -112.30723100),
        CLLocationCoordinate2D(latitude: 40.53011869, longitude: -111.84200550),
        CLLocationCoordinate2D(latitude: 40.76493678, longitude: -111.84200550),
        CLLocationCoordinate2D(latitude: 40.76493678, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -113.07125720),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -109.56493310),
        CLLocationCoordinate2D(latitude: 40.46457078, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -112.30304140),
        CLLocationCoordinate2D(latitude: 40.62582840, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.86856020),
        CLLocationCoordinate2D(latitude: 40.61843887, longitude: -111.69151770),
        CLLocationCoordinate2D(latitude: 40.32285220, longitude: -111.46850600),
        CLLocationCoordinate2D(latitude: 40.67990548, longitude: -111.96209100),
        CLLocationCoordinate2D(latitude: 40.66121193, longitude: -112.03265780),
        CLLocationCoordinate2D(latitude: 41.17704593, longitude: -111.85490400),
        CLLocationCoordinate2D(latitude: 40.67723071, longitude: -111.85490400),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -113.07125720),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -113.07125720),
        CLLocationCoordinate2D(latitude: 37.67662440, longitude: -113.07125720)
    ]
    // creates a new array that will be used to store the data.
    let details : [String] =
    [
        "Home Football Game vs. Stansbury",
        "Away Football Game vs. Tooele",
        "5A & 6A Divisionals Meet",
        "USHAA 5A State Championships Meet",
        "Bridgerland Band Invitational",
        "Wasatch Front Invitational",
        "Away Volleyball Game vs. Payson",
        "Away Volleyball Game vs. Cottonwood",
        "Home Volleyball Game vs. Stansbury",
        "Home Volleyball Game vs. Uintah",
        "Home Volleyball Game vs. Cedar Valley",
        "Away Volleyball Game vs. Tooele",
        "Beehive Bonanza",
        "Beehive Bonanza",
        "Westlake Thunderdome Speech and Debate Tournament",
        "Westlake Thunderdome Speech and Debate Tournament",
        "Husky Howl",
        "Shakespeare Competition",
        "Away Football Game vs. Uintah",
        "Home Football Game vs. Cedar Valley",
        "Fall Choir/Orchestra Concert",
        "Music Department Halloween Social",
        "Home Football Game vs. Tooele",
        "Away Football Game vs. Stansbury",
        "Home Football Game vs. Mountain View",
        "Home Football Game vs. Pason",
        "Away Football Game vs. Timpanogos",
        "Park City Invitational Quinn's Junction",
        "Border Wars Valley Regional Park",
        "Royal Run Roy High School",
        "Region VII Championships Cottonwood Complex",
        "Shakespeare Competition",
        "Shakespeare Competition",
        "Shakespeare Competition"

        
    ]
    // creates a new array that will be used to store the data.
    let titles : [String] =
    [
        "Football Game",
        "Football Game",
        "Cross Country",
        "Cross Country",
        "Marching Band",
        "Marching Band",
        "Volleyball (Girls)",
        "Volleyball (Girls)",
        "Volleyball (Girls)",
        "Volleyball (Girls)",
        "Volleyball (Girls)",
        "Volleyball (Girls)",
        "Debate",
        "Debate",
        "Debate",
        "Debate",
        "School Dance",
        "Threatre",
        "Football Game (Sophomore)",
        "Football Game (Sophomore)",
        "Concert",
        "Music Social",
        "Football Game",
        "Football Game",
        "Football Game",
        "Football Game",
        "Football Game",
        "Cross Country",
        "Cross Country",
        "Cross Country",
        "Cross Country",
        "Threatre",
        "Threatre",
        "Threatre"
        
    ]
    // creates a new array that will be used to store the data.
    let year : [Int] =
    [
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022,
        2022
    ]
    // creates a new array that will be used to store the data.
    let month : [Int] =
    [
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        10,
        9,
        9,
        9,
        9,
        9,
        9,
        9,
        9,
        9,
        9,
        9,
        9
    ]
    // creates a new array that will be used to store the data.
    let day : [Int] =
    [
        1,
        12,
        11,
        25,
        1,
        8,
        4,
        6,
        12,
        18,
        20,
        25,
        7,
        8,
        14,
        15,
        29,
        1,
        6,
        11,
        13,
        28,
        2,
        9,
        16,
        23,
        30,
        9,
        17,
        24,
        30,
        28,
        29,
        30
    ]
    // creates a new array that will be used to store the data.
    let address : [String] =
    [
        "7350 S 900 E, Midvale, UT 84047",
        "1389 Aviator Ave, Eagle Mountain, UT 84005",
        "400 S 1850 W, Orem, UT 84058",
        "2280 Rose Park Ln, Salt Lake City, UT 84116",
        "E 1000 N, Logan, UT 84341",
        "12476 2700 W, Riverton, UT 84065",
        "1050 S Main St, Payson, UT 84651",
        "5715 S 1300 E, Murray, UT 84121",
        "7350 S 900 E, Midvale, UT 84047",
        "7350 S 900 E, Midvale, UT 84047",
        "7350 S 900 E, Midvale, UT 84047",
        "301 W Vine St, Tooele, UT 84074",
        "201 Presidents' Cir, Salt Lake City, UT 84112",
        "201 Presidents' Cir, Salt Lake City, UT 84112",
        "Virtual",
        "Virtual",
        "7350 S 900 E, Midvale, UT 84047",
        "351 W University Blvd, Cedar City, UT 84720",
        "1880 W 500 N, Vernal, UT 84078",
        "7350 S 900 E, Midvale, UT 84047",
        "7350 S 900 E, Midvale, UT 84047",
        "7350 S 900 E, Midvale, UT 84047",
        "7350 S 900 E, Midvale, UT 84047",
        "5300 Aberdeen Ln, Stansbury Park, UT 84074",
        "7350 S 900 E, Midvale, UT 84047",
        "7350 S 900 E, Midvale, UT 84047",
        "1450 200 E, Orem, UT 84057",
        "84098, Gillmor Way, Park City, UT 84060",
        "5100 S 2700 W, Taylorsville, UT 84129",
        "2150 W 4800 S, Roy, UT 84067",
        "4400 S 1300 E, Millcreek, UT 84124",
        "351 W University Blvd, Cedar City, UT 84720",
        "351 W University Blvd, Cedar City, UT 84720",
        "351 W University Blvd, Cedar City, UT 84720"

    ]
    let date : [Date] = [
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date(),
        Date()
    ]
    // creates a new array that will be used to store the data.
    for index in 0 ..< 33
    {
        let currentRegion = MKCoordinateRegion (center: regions[index], span: (MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
        
        mapsItems.append(Maps(title: titles[index], details: details[index], year: year[index], month: month[index], day: day[index], address: address[index], location: location[index], regions: currentRegion, date: date[index]))
    }
    
    return mapsItems
}

