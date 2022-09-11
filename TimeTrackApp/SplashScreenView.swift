//
//  SplashScreenView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

struct SplashScreenView: View
{
    @State private var isActive = false
    @State private var size = 0.8
    @State private var ocacity = 0.5
    
    var body: some View
    {
        
        if isActive
        {
            LoginView()
        }else{
            ZStack
            {
                Color.blue
                    .ignoresSafeArea(.all)
                VStack
                {
                    VStack
                    {
//                        Image(systemName: "hare.fill")
//                            .font(Font.custom("hare", size: 80))
//                            .foregroundColor(.white)
                        Image("icon")
                        Text("Time Track")
                            .font(Font.custom("Baskerville-Bold", size: 26))
                            .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(ocacity)
                    .onAppear
                    {
                        withAnimation(.easeIn(duration: 1.2))
                        {
                            self.size = 1.7
                            self.ocacity = 1.0
                        }
                    }
                }
                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                    {
                        withAnimation
                        {
                            self.isActive = true
                        }
                    }
            }
            }
            
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SplashScreenView()
    }
}
