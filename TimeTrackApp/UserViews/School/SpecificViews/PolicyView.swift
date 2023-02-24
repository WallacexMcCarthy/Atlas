//
//  PolicyViews.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 2/24/23.
//

import SwiftUI

struct PolicyView: View
{
    var body: some View
    {
       
            List
            {
                Section(header: Text("School Policies"))
                {
                    NavigationLink("Attendance Policy", destination: CustomPDFView(displayedPDFURL: Attendance_Policy_URL))
                    NavigationLink("School Fees Policy", destination: CustomPDFView(displayedPDFURL: School_Fee_Policy_URL))
                    NavigationLink("Technology Policy", destination: CustomPDFView(displayedPDFURL: Technology_Policy_URL))
                    NavigationLink("District Policy", destination: CustomPDFView(displayedPDFURL: District_Policy_URL))
                }
            }
        
    }
}

struct PolicyViews_Previews: PreviewProvider {
    static var previews: some View {
        PolicyView()
    }
}
