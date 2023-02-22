//
//  SplashScreenView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

/*
 Creates a splash screen that is really an annimated screen with text and a logo. Once the time delay finoishes it will bring us to the login screen.
 */

struct SplashScreenView: View
{
    @State private var isActive = false
    @State private var size = 0.8
    @State private var ocacity = 0.5
    
    var body: some View
    {
        // if isActive is true then it will direct thte user to the login screen.
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
                        /*
                         Calls the logo and creates the text area with specific pararmeters.
                         */
                        Image("icon")
                        Text("Time Track")
                            .font(Font.custom("Baskerville-Bold", size: 26))
                            .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(ocacity)
                    .onAppear
                    {
                        // this is hte annimation part. it will increace by a size of 170 %
                        withAnimation(.easeIn(duration: 1.2))
                        {
                            self.size = 1.7
                            self.ocacity = 1.0
                            
                        }
                    }
                }
                .onAppear
                {
                    // after doing the annimation the program will sleep for 2 seconds thn set isActive to be true.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                    {
                        withAnimation(.easeIn(duration: 0.3))
                        {
                            self.size = 50
                            self.ocacity = 0
                            
                        }
                    }
                    DispatchQueue.main
                        .asyncAfter(deadline: .now() + 3)
                    {
                        withAnimation(.easeIn(duration: 0.2))
                        {
                            isActive = true
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
