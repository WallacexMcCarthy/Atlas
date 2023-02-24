//
//  SchedulesView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 2/23/23.
//

import SwiftUI

struct SchedulesView: View
{
    var body: some View
    {
        List
        {
            Section(header: Text("School Schdules"))
            {
                NavigationLink("Weekday Schedule", destination: CustomPDFView(displayedPDFURL: Weekday_Schedule_URL))
                NavigationLink("Friday Schedule", destination: CustomPDFView(displayedPDFURL: Friday_Schedule_URL))
                NavigationLink("AB Calendar", destination: CustomPDFView(displayedPDFURL: AB_Calendar_URL))
                NavigationLink("Fee Schedule", destination: CustomPDFView(displayedPDFURL: Fee_Schedule_URL))
                NavigationLink("Teacher Lunches", destination: CustomPDFView(displayedPDFURL: Lunch_Schedule_URL))
            }
        }
    }
}

struct SchedulesView_Previews: PreviewProvider {
    static var previews: some View {
        SchedulesView()
    }
}
