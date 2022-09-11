//
//  AttendanceView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct AttendanceView: View {
    var body: some View {
        NavigationView
        {
            ZStack
            {
                Color.white
                
                    .ignoresSafeArea(.all)
            }
            .navigationTitle("Attandence")
        }

    }
}

struct AttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceView()
    }
}
