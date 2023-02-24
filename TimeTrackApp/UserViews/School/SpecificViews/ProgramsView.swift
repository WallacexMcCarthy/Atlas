//
//  ProgramsView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 2/24/23.
//

import SwiftUI

struct ProgramsView: View
{
    var body: some View
    {
        NavigationView
        {
            List
            {
                Section(header: Text("School Programs"))
                {
                    NavigationLink("International Baccalaureate", destination: CustomPDFView(displayedPDFURL: AB_Calendar_URL))
                    NavigationLink("Sterling Scholar", destination: CustomPDFView(displayedPDFURL: Sterling_Scholar_URL))
                    NavigationLink("Career and Technical Education (CTE)", destination: CustomPDFView(displayedPDFURL: CTE_Classes_URL))
                    NavigationLink("Work Based Learning", destination: CustomPDFView(displayedPDFURL: AB_Calendar_URL))
                    NavigationLink("AP Programs", destination: CustomPDFView(displayedPDFURL: AP_Courses_URL))
                    NavigationLink("Concurrent Enrollment", destination: CustomPDFView(displayedPDFURL: Concurrent_Enrollment_URL))
                }
            }
        }
    }
}

struct ProgramsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramsView()
    }
}
