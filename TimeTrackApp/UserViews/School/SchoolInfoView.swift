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
        NavigationView
        {
            ScrollView
            {
                ZStack
                {
                    Rectangle()
                        .frame(width: 370, height: 480)
                        .cornerRadius(20)
                        .foregroundColor(Color.white)                                                          .shadow(color: .black, radius: 5, x : 0, y : 4)
                        .position(x: 196, y: 306)
                    
                    VStack
                    {
                        if #available(iOS 16.1, *) {
                            HStack{
                                Text("School Info")
                                    .font(.largeTitle)
                                    .bold()
                                Spacer()
                                    .frame(width: 180)
                            }
                        } else {
                            // Fallback on earlier versions
                        }
                        
                       Spacer()
                            .frame(height: 40)
                        Image("InfoPic")
                            .resizable()
                            .frame(width: 344, height: 229)
                        .scaledToFit()
                        VStack
                        {
                            VStack
                            {
                                Text("Address                                                     ")
                                    .font(.title2.bold())
                                Spacer()
                                    .frame(height: 2)
                                Text("7350 S 900 E, Midvale, UT 84047                 ")
                            }
                            Spacer()
                                .frame(height: 5)
                            VStack
                            {
                                Spacer()
                                    .frame(width: 20)
                                Text("Phone                                                         ")
                                    .font(.title2.bold())
                                Spacer()
                                    .frame(height: 2)
                                Text("(801) 826-6000                                                 ")
                                Spacer()
                                    .frame(width: 130)
                            }
                            VStack
                            {
                                Spacer()
                                    .frame(width: 16)
                                Text("Office Hours                                           ")
                                    .font(.title2.bold())
                                Spacer()
                                    .frame(height: 2)
                                Text("Monday – Friday, 7 a.m. – 3:00 p.m.             ")
                                Spacer()
                                    .frame(width: 50)
                            }
                            Spacer()
                                .frame(height: 6)
                            HStack
                            {
                                Spacer()
                                    .frame(width: 14)
                                Text("Website: ")
                                    .font(.title2.bold())
                                Text("https://hhs.canyonsdistrict.org")
                                    .foregroundColor(Color("DarkBlue"))
//                                    .background(Color("Beige"))
                                Spacer()
                                    .frame(width: 10)
                            }
                        }
                        
                        Spacer()
                            .frame(height: 35)
                        VStack{
                            HStack{
                                NavigationLink{
                                    SchedulesView()
                                }label: {
                                    VStack{
                                        Image(systemName: "clock")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color.white)
                                        Spacer()
                                            .frame(height: 8)
                                        Text("Schedules")
                                            .font((.title3))
                                    }
                                    .frame(width: 170, height: 90)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                }
                                
                                Spacer()
                                    .frame(width: 10)
                                
                                NavigationLink{
                                    CustomPDFView(displayedPDFURL: School_Disclosure_URL)
                                }label: {
                                    VStack{
                                        Image(systemName: "newspaper")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color.white)
                                        Spacer()
                                            .frame(height: 8)
                                        Text("Disclosures")
                                            .font((.title3))
                                    }
                                    .frame(width: 170, height: 90)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                }
                            }
                            
                            
                            HStack{
                                NavigationLink{
                                    PolicyView()
                                }label: {
                                    VStack{
                                        Image(systemName: "doc.append")
                                            .resizable()
                                            .frame(width: 26, height: 30)
                                            .foregroundColor(Color.white)
                                        Spacer()
                                            .frame(height: 8)
                                        Text("Policies")
                                            .font((.title3))
                                    }
                                    .frame(width: 170, height: 90)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                }
                                
                                Spacer()
                                    .frame(width: 10)
                                
                                NavigationLink{
                                    PolicyView()
                                }label: {
                                    VStack{
                                        Image(systemName: "square.3.layers.3d")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color.white)
                                        Spacer()
                                            .frame(height: 8)
                                        Text("Programs")
                                            .font((.title3))
                                    }
                                    .frame(width: 170, height: 90)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                }
                            }
                            
                            HStack{
                                NavigationLink{
                                    PolicyView()
                                }label: {
                                    VStack{
                                        Image(systemName: "figure.run")
                                            .resizable()
                                            .frame(width: 26, height: 30)
                                            .foregroundColor(Color.white)
                                        Spacer()
                                            .frame(height: 8)
                                        Text("Activities")
                                            .font((.title3))
                                    }
                                    .frame(width: 170, height: 90)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                }
                                
                                Spacer()
                                    .frame(width: 10)
                                
                                NavigationLink{
                                    CustomPDFView(displayedPDFURL: AB_Calendar_URL)
                                }label: {
                                    VStack{
                                        Image(systemName: "gearshape")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Spacer()
                                            .frame(height: 10)
                                        Text("Resources")
                                            .font((.title3))
                                    }
                                    .frame(width: 170, height: 90)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                }
                            }
                            
                            HStack{
                                NavigationLink{
                                    SchedulesView()
                                }label: {
                                    VStack{
                                        Image(systemName: "person.2")
                                            .resizable()
                                            .frame(width: 35, height: 25)
                                        Spacer()
                                            .frame(height: 10)
                                        Text("Counseling")
                                            .font((.title3))
                                    }
                                    .frame(width: 170, height: 90)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.white)
        }
    }
}

struct SchoolInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolInfoView()
    }
}
