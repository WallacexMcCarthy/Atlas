//
//  SocialView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct SocialView: View {
    var body: some View {
        NavigationView
        {
            ZStack
            {
                Color.white
                    .ignoresSafeArea(.all)
            }
            .navigationTitle("Social")
        }

    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
