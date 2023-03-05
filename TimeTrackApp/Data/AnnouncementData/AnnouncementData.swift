//
//  AnnouncementData.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/24/22.
//

import Foundation

/*
 It calls the data file Announcements and uses the variabels creeated there to make an array and it will return an array that has new information.
 */

func loadAnnouncementData() -> [Announcments]
{
    // creates a new array that will be used to store the data.
    var announcementItems : [Announcments] = []
    // creates a new array that will be used to store the data.
    let title: [String] =
    [
        "Canyons District Students Rank No. 1 in Utah for Overall Testing Scores",
        "CSD Thinks Safe: Summer Months Spent Conducting Districtwide Security Review",
        "Canyons following state law requiring period products in girls, unisex bathrooms",
        "20 Canyons District seniors named National Merit Scholarship Program semifinalists",
        "Canyons to Promote Regular School Attendance with ‘Show Up’ Challenge"
    ]
    // creates a new array that will be used to store the data.
    let announcement: [String] =
    [
        "Canyons School District is the highest-ranked district in Utah for overall testing scores, according to Public School Review. The ranking is based on the percentage of schools within a District to have placed in the top 5 percent of all schools statewide for math and reading test scores.",
        "In response to heightened worries about school safety following the last-week-of-school tragedy in Uvalde, Texas, Canyons has undertaken a review of the safety and security measures at the District’s campuses and central offices.",
        "Starting this year, all girls and family restrooms in Canyons schools will be equipped with free period products. HB162, which was passed by state lawmakers in 2022, requires Utah school districts to provide period products in each girls or unisex bathroom at every school, including at the elementary level. The law went into effect on July 1.  Custodial crews are currently installing the dispensers.",
        "Twenty seniors from Canyons School District high schools have been named as 2023 National Merit Scholarship Program semifinalists and are in the running for nearly $28 million scholarships that will be awarded next spring. Hillcrest High boasts 13 National Merit semifinalists, placing it in the top three statewide for fielding the most National Merit semifinalists.",
        "Canyons is making a concerted effort this year to promote prompt and regular school attendance. When parents registered their children for school, they were encouraged to review “Show Up” attendance pledges at home. With September being School Attendance Awareness Month, schools are also launching attendance challenges with prizes for classrooms and grade levels that show the biggest attendance gains. Individual students will also get to compete for prizes by submitting social media videos and memes describing what showing up means to them, whether it’s at work and school, or for their friends, fellow students, and family. "
    ]
    // creates a new array that will be used to store the data.
    let immageLinkSource: [String] =
    [
        "0 - Canyons Rank",
        "1 - Canyons Safe",
        "2 - CSD",
        "3 - National Merit",
        "4 - Show Up"
    ]
    // creates a for loop that will loop through the array and add the data to the array.
    for index in 0 ..< title.count
    {
       
        announcementItems.append(Announcments(title: title[index], announcment: announcement[index], immageLinkSource: immageLinkSource[index]))
    }
    
    return announcementItems
}
