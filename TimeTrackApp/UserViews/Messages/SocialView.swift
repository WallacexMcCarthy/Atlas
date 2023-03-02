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

struct SocialView: View
{
    @State private var messageText = ""
    @State var messages : [String] = ["Welcome to the Help Desk. \n If you need to report a bug, type \"report a bug\""]
    var body: some View
    {
        ZStack
        {
            
            VStack
            {
                HStack
                {
                    Text("Help Desk")
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "buble.left.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color("Clay"))
                    
                }
                ScrollView()
                {
                    ForEach(messages, id: \.self)
                    {
                        message in
                        if message.contains("[USER]")
                        {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")

                            HStack
                            {
                                Spacer()
                                Text(newMessage)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)

                            }
                        } else
                        {
                            HStack
                            {
                                Text(message)
                                    .padding()
                                    .background(Color.gray.opacity(0.15))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                                Spacer()
                            }
                        }
                    }
                    .rotationEffect(.degrees(180))
                }
                .rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
                HStack
                {
                    TextField("Question or Request", text: $messageText)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                        .onSubmit
                        {
                            sendMessage(message: messageText)
                        }
                    Button{
                        sendMessage(message: messageText)
                    }label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(Color.blue.opacity(1))
                    }
                    .font(.system(size: 26))
                    .padding(.horizontal, 10)
                }
                .padding()
        }
        }
        
        
        
        
        

    }
    func sendMessage(message : String)
    {
            withAnimation
            {
                messages.append("[USER]" + message)
                self.messageText = ""
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
            {
                withAnimation
                {
                    messages.append(getBotResponse(message: message))
                }
            }
        }
    
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
