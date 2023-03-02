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
    @State var changeProfileIamgeOne = false
    @State var changeProfileIamgeTwo = false
    @State var openCameraRoll = false
    @State var imageSelectedOne = UIImage()
    @State var imageSelectedTwo = UIImage()
    @State var imageDate = ""
    @State var imageTitle = ""
    @State var imageOneTitle = ""
    @State var imageTwoTitle = ""
    @State var imageOneDate = ""
    @State var imageTwoDate = ""
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
                            Spacer()
                                .frame(height: 70)
                            Text("Share a Picture")
                                .font(.largeTitle)
                                .bold()
                            ZStack(alignment: .bottomTrailing)
                            {
                                HStack
                                {
                                    Button(action:
                                            {
                                        changeProfileIamge = true
                                        openCameraRoll = true
//                                        pictureProperties()
                                    }, label:
                                            {
                                        if(changeProfileIamgeOne)
                                        {
                                            Image(uiImage: imageSelectedTwo)
                                                .resizable()
                                                .frame(width: 200,height: 150)
                                            
                                        }else if(changeProfileIamge)
                                        {
                                            Image(uiImage: imageSelectedOne)
                                                .resizable()
                                                .frame(width: 200,height: 150)
                                        }else
                                        {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .frame(width: 180,height: 130)
                                            .foregroundColor(Color.black)
                                        }
                                        
                                        
    //                                Image(systemName: "plus")
    //                                    .frame(width: 30, height: 30)
    //                                    .foregroundColor(Color.white)
    //                                    .background(Color.gray)
    //                                    .clipShape(Circle())
                                        
                                    }
                                           
                                    )
                                    VStack
                                    {
                                        TextField("  Date (00/00/0000)", text: $imageDate)
                                            .frame(width: 200, height: 50)
                                            .background(Color.gray.opacity(0.1))
                                            .cornerRadius(10)
                                        TextField("  Title", text: $imageTitle)
                                            .frame(width: 200, height: 50)
                                            .background(Color.gray.opacity(0.1))
                                            .cornerRadius(10)
                                        
                                        Button("Post")
                                        {
                                            if(newImagePickerOne)
                                            {
                                                newImagePickerTwo = true
                                            }
                                            newImagePickerOne = true
                                            transferImageInfo()
                                            count += 1
                                        }
                                        .frame(width: 200, height: 30)
                                        .background(Color("DarkBlue"))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(20)
                                    }
                                }
                                
                            }
                            .sheet(isPresented: $openCameraRoll)
                            {
                                ImagePicker(selectedImage: $imageSelectedOne, sourceType: .photoLibrary)
                                
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
                            if(newImagePickerTwo)
                            {
                                VStack
                                {
                                    Text(imageTwoDate).frame(width: 190, height: 30)
                                        .background(Color.gray.opacity(0.1))
                                    Image(uiImage: imageSelectedTwo)
                                        .resizable()
                                        .frame(width: 200,height: 150)
                                    Text(imageTwoTitle)
                                        .frame(width: 190, height: 50)
                                        .background(Color.gray.opacity(0.1))
                            }
                            }
                            VStack
                            {
                                Text(imageOneDate).frame(width: 190, height: 30)
                                    .background(Color.gray.opacity(0.1))
                                Image(uiImage: imageSelectedOne)
                                    .resizable()
                                    .frame(width: 200,height: 150)
                                Text(imageOneTitle)
                                    .frame(width: 190, height: 50)
                                    .background(Color.gray.opacity(0.1))
                            }
                            
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
                            Text("       Hillcrest theater presents A Winters Tale")
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
                    Spacer()
                        .frame(height: 50)
                    
                }
            }
        }
        .background(Color("Beige"))
        .ignoresSafeArea()
    }
    func transferImageInfo()
    {
        if(count != 0)
        {
            imageTwoDate = imageDate
            imageTwoTitle = imageTitle
            imageDate = ""
            imageTitle = ""
            changeProfileIamge = false
        }else
        {
            imageOneDate = imageDate
            imageOneTitle = imageTitle
            imageDate = ""
            imageTitle = ""
            changeProfileIamge = false
        }
    }
    func pictureProperties()
    {
        if(count == 1)
        {
            changeProfileIamgeOne = true
            openCameraRoll = true
        }else if(count == 2)
        {
            changeProfileIamgeOne = true
            openCameraRoll = true
        }else
        {
            changeProfileIamge = true
            openCameraRoll = true
        }
    }
}

struct PicturesView_Previews: PreviewProvider {
    static var previews: some View {
        PicturesView()
    }
}
