//
//  PicturesView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 2/25/23.
//

import SwiftUI

struct PicturesView: View
{
    @State var newImagePickerOne = false
    @State var newImagePickerTwo = false
    @State var changeProfileIamge = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    var body: some View {
        ScrollView
        {
            ZStack
            {
                VStack
                {
                    HStack
                    {
                        VStack
                        {
                            ZStack(alignment: .bottomTrailing)
                            {
                                Button(action:
                                        {
                                    changeProfileIamge = true
                                    openCameraRoll = true
                                    if(newImagePickerOne)
                                    {
                                        newImagePickerTwo = true
                                    }
                                    newImagePickerOne = true                                }, label:
                                        {
                                    if(changeProfileIamge)
                                    {
                                        Image(uiImage: imageSelected)
                                            .resizable()
                                            .frame(width: 200,height: 150)
                                        
                                    }else
                                    {
                                        
                                        Image(systemName: "photo.on.rectangle.angled")
                                            .resizable()
                                            .frame(width: 200,height: 150)
                                            .foregroundColor(Color.black)
                                    }
                                    
//                                Image(systemName: "plus")
//                                    .frame(width: 30, height: 30)
//                                    .foregroundColor(Color.white)
//                                    .background(Color.gray)
//                                    .clipShape(Circle())
                                    
                                }
                                )
                            }
                            .sheet(isPresented: $openCameraRoll)
                            {
                                ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                            }
                        }
                        VStack
                        {
                            Spacer()
                        }
                    }
                    HStack
                    {
                        if(newImagePickerOne)
                        {
                            VStack
                            {
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .frame(width: 200,height: 150)
                            }
                            if(newImagePickerTwo)
                            {
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .frame(width: 200,height: 150)
                            }
                        }
                    }
                    HStack
                    {
                        VStack
                        {
                            Text("02/25/2023").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("BBall-Uintah")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("Uintah Basketball Game")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        Spacer()
                            .frame(width: 10)
                        VStack
                        {
                            Text("02/14/2023").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("BBall-Uintah_Crowd")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("Uintah Basketball Game")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        
                    }
                    HStack
                    {
                        VStack
                        {
                            Text("02/12/2023").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("Theater_Shakespear")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("       Hillcrest theater presents \"A Winters Tale")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        Spacer()
                            .frame(width: 10)
                        VStack
                        {
                            Text("01/28/2023").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("Orchestra_SanDiego")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("    Orchestra trip to \n          San Diego")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        
                    }
                    HStack
                    {
                        VStack
                        {
                            Text("01/17/2023").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("BBall_Hariman")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("Harriman Basketball \n            Game")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        Spacer()
                            .frame(width: 10)
                        VStack
                        {
                            Text("01/16/2023").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("Drill_Regions")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("Drill Regionals")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        
                    }
                    HStack
                    {
                        VStack
                        {
                            Text("12/17/2022").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("BBall-Uintah")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("Uintah Basketball Game")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        Spacer()
                            .frame(width: 10)
                        VStack
                        {
                            Text("12/17/2022").frame(width: 190, height: 30)
                                .background(Color.gray.opacity(0.1))
                            Image("BBall-Uintah_Crowd")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 130)
                            Text("Uintah Basketball Game")
                                .frame(width: 190, height: 50)
                                .background(Color.gray.opacity(0.1))
                        }
                        
                    }
                    
                }
            }
        }
    }
}

struct PicturesView_Previews: PreviewProvider {
    static var previews: some View {
        PicturesView()
    }
}
