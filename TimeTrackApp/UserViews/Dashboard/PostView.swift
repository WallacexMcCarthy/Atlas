//
//  PostView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/27/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    let post: Post
    let screenWidth: CGFloat
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 370, height: 320)
                .cornerRadius(20)
                .foregroundColor(Color.white)                                                          .shadow(color: .black, radius: 5, x : 0, y : 4)
                .position(x: 196, y: 175)
            VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    .frame(height: 6)
                    HStack(spacing: 8) {
                        Spacer()
                            .frame(width: 10)
                        WebImage(url: URL(string: post.profileImageName))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(50)
                            .overlay(RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color(.label), lineWidth: 2))
                        Text(post.userName).font(.headline)
                        Spacer()
                        Button{
                            Link("", destination: URL(string: "instagram.com")!)
                        }label: {
                            Image(systemName: "square.and.arrow.up")
                                
                        }
                        Spacer()
                            .frame(width: 15)
                    }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                HStack{
                    Spacer()
                        .frame(width:12)
                    WebImage(url: URL(string: post.imageName))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 368, height: 180)
                        .clipped()

                }
                    Text(post.text)
                        .lineLimit(nil)
                        .font(.system(size: 15))
                        .padding(.leading, 16).padding(.trailing, 16).padding(.bottom, 16)
            }.listRowInsets(EdgeInsets())
        }
    }
}


//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(post: <#Post#>, screenWidth: <#CGFloat#>)
//    }
//}
