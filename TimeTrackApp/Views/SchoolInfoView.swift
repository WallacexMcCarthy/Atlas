//
//  SchoolInfoView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct SchoolInfoView: View {
    var body: some View {
        NavigationView
        {
            ZStack
            {
                Color.white
                    .ignoresSafeArea(.all)
            }
            .navigationTitle("School Information")
        }
    }
}

struct SchoolInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfoView()
    }
}
