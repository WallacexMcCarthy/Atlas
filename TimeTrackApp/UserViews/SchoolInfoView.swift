//
//  SchoolInfoView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI

// this view will display all school info about Hillcrest Higshhcool or the respective highschool to the user.

struct SchoolInfoView: View
{
    var body: some View
    {
        ScrollView
        {
            ZStack
            {
                VStack
                {
                    Text("School Info")
                        .bold()
                        .font(.largeTitle)
                    Image("InfoPic")
                        .resizable()
                    .scaledToFit()
                    VStack
                    {
                        HStack
                        {
                            Text("Address: ")
                                .font(.title2.bold())
                            Text("7350 S 900 E, Midvale, UT 84047")
                        }
                        HStack
                        {
                            Text("Phone:      ")
                                .font(.title2.bold())
                            Text("(801) 826-6000")
                            Spacer()
                                .frame(width: 130)
                        }
                        HStack
                        {
                            Text("Office Hours:     ")
                                .font(.title2.bold())
                            Text("Monday – Friday \n 7 a.m. – 3:00 p.m.")
                            Spacer()
                                .frame(width: 50)
                        }
                        HStack
                        {
                            Text("Website: ")
                                .font(.title2.bold())
                            Text("https://hhs.canyonsdistrict.org")
                            Spacer()
                                .frame(width: 20)
                        }
                    }
                    HStack
                    {
                        Text("Schedules: ")
                            .font(.title2.bold())
                        Button("School Schedules")
                        {
                            
                        }
                        .frame(width: 230, height: 25)
                        .background(Color.blue.opacity(0.5))
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                    }
                    HStack
                    {
                        Text("Discloure:   ")
                            .font(.title2.bold())
                        Button("School Disclosure")
                        {
                            
                        }
                        .frame(width: 230, height: 25)
                        .background(Color.blue.opacity(0.5))
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                    }
                    HStack
                    {
                        Text("Policies:      ")
                            .font(.title2.bold())
                        Button("School Policies")
                        {
                            
                        }
                        .frame(width: 230, height: 25)
                        .background(Color.blue.opacity(0.5))
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                    }
                    HStack
                    {
                        Text("Programs:  ")
                            .font(.title2.bold())
                        Button("School Programs")
                        {
                            
                        }
                        .frame(width: 230, height: 25)
                        .background(Color.blue.opacity(0.5))
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                    }
                    HStack
                    {
                        Text("Activities:  ")
                            .font(.title2.bold())
                        Button("School Activities")
                        {
                            
                        }
                        .frame(width: 230, height: 25)
                        .background(Color.blue.opacity(0.5))
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                    }
                    VStack
                    {
                        HStack
                        {
                            Text("Recources:  ")
                                .font(.title2.bold())
                            Button("School Recources")
                            {
                                
                            }
                            .frame(width: 230, height: 25)
                            .background(Color.blue.opacity(0.5))
                            .foregroundColor(Color.black)
                            .cornerRadius(20)
                        }
                        HStack
                        {
                            Text("Counseling:  ")
                                .font(.title2.bold())
                            Button("School Counseling")
                            {
                                
                            }
                            .frame(width: 230, height: 25)
                            .background(Color.blue.opacity(0.5))
                            .foregroundColor(Color.black)
                            .cornerRadius(20)
                        }
                    }
                        
                }
            }
        }
        .background(Color.blue.opacity(0.1))
    }
}

struct SchoolInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfoView()
    }
}
