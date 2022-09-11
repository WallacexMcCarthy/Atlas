//
//  DashboardView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI


struct DashboardView: View
{
    @State private var user = "Dheeraj"
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack
                {
                    Text("Welcome \(user)")
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .font(.body)
                        .padding()
                }
                .offset(y: 0)
                .frame(minWidth: 0, maxHeight: 800, alignment: .topLeading)
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
