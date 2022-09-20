//
//  MapsData.swift
//  TimeTrackApp
//
//  Created by Mccarthy, Wallace on 9/20/22.
//

import MapKit

let definitions = Bundle.main.url(forResource: "Placeholder", withExtension: "pdf")!

func loadMapData() -> [Maps]
{
    var mapsItems : [Maps] = []
    
    let regions : [CLLocationCoordinate2D] =
    [
        CLLocationCoordinate2D(latitude: 34.0213889, longitude: -118.0119444),
        CLLocationCoordinate2D(latitude: 3.406448, longitude: 6.465422),
        CLLocationCoordinate2D(latitude: 19.228825, longitude: 72.854118),
        CLLocationCoordinate2D(latitude: 46.392410, longitude: 94.636230),
        CLLocationCoordinate2D(latitude: 37.3700, longitude: 122.0400),
        CLLocationCoordinate2D(latitude: -87.6501, longitude: 41.8500)
    ]
    
    let details : [String] =
    [
        "Computers contain heavy metals, like lead and toxic chemicals that pollute the soil and groundwater. Run-off from these landfills contaminates water that we use and thus exposes us to those dangerous chemicals. ",
        
        "Scamming violates laws through fraud, deception, the theft of property or money. If caught these scammers will be charred under a civil suit.",
        
        "Illegally downloading movies, Music, Broadcasts, Videos, etc hurt the producers of these things by getting this content for free. Some places have hundreds of thousands and maybe even millions of illegally downloaded movies, songs and video games. One example is a Minnesota woman, one of the last people to be individually prosecuted in the US for illegal downloading and file-sharing, faces a $220,000 dollar fine.",
        
        "Silicon valley is the epicenter of the start of technological companies. Many of the largest companies relating to technology came out out of Silicon Valley, including Apple, Microsoft and Adobe",
        
        "Pewresearch states that the internet has had a negative effect on morality especially in countries with high internet usage such as the United States which is at 87 percent internet usage. From this 42 percent of people think that the internet is a bad influence on people’s morality. And this could be because of the internet’s ability to provide one person with any information that they would want and possibly more. From this Illinois has the highest internet usage at 87.8%. And in Illinois, Chicago is the largest city with the most internet usage."
        
    ]
    
    let titles : [String] =
    [
        "Largest Environmental Impact",
        "Malware and Scammers",
        "Illegally Downloading",
        "Silicon Valley",
        "Harmful Effects on morality"
    ]
    
    for index in 0 ..< 5
    {
        let currentRegion = MKCoordinateRegion (center: regions[index], span: (MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
        
        mapsItems.append(Maps(title: titles[index], details: details[index], location: currentRegion))
    }
    
    return mapsItems
}

