//
//  SocialView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

/*
 This view will allow everyone who has access to this app to send and recieve messgae and pictures much like social media.
 */

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
