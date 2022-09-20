//
//  UpcomingEventsView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct UpcomingEventsView: View {
    var body: some View {
        NavigationView
        {
            ZStack
            {
                Color.white
                    .ignoresSafeArea(.all)
            }
            .navigationTitle("Upcoming Events")
        }
    }
}

struct UpcomingEventsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingEventsView()
    }
}
