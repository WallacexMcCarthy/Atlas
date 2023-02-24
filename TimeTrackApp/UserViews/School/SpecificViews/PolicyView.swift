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
        NavigationView
        {
            List
            {
                Section(header: Text("School Policies"))
                {
                    NavigationLink("School Fees Policy", destination: CustomPDFView(displayedPDFURL: AB_Calendar_URL))
                }
            }
        }
    }
}

struct PolicyViews_Previews: PreviewProvider {
    static var previews: some View {
        PolicyView()
    }
}
