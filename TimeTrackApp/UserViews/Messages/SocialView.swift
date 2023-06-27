//
//  SocialView.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/10/22.
//

import SwiftUI
import OpenAISwift

/*
 This view will allow everyone who has access to this app to send and recieve messgae and pictures much like social media.
 */

/**
    This class will allow the user to send a message to the OpenAI API and then recieve a response from the API and then display the response in the chat.
    */
final class ViewModel: ObservableObject {
    init() {}
    
    private var client: OpenAISwift?
    
    /**
        This function will send the message to the OpenAI API and then recieve a response from the API and then display the response in the chat.
        */
    func setup(){
        client = OpenAISwift(authToken: "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")
    }
    /**
        This function will send the message to the OpenAI API and then recieve a response from the API and then display the response in the chat.
        */
    func send(text: String, completion: @escaping (String) -> Void){
        client?.sendCompletion(with: text,
                               maxTokens: 500,
                               completionHandler:
                                {
            result in
            switch result{
            case .success(let model):
                let output = model.choices.first?.text ?? "Failed"
                completion(output)
            case .failure:
                break
            }
            
        })
    }
}


struct SocialView: View
{
    @ObservedObject var viewModel = ViewModel()
    @State private var messageText = ""
    @State var messages : [String] = ["Welcome to the Help Desk. \n If you need to report a bug, type \"report a bug\". \n If you would like to talk to an assistant please type \"Assistant\"."]
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
                    Image(systemName: "bubble.left.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color.blue)
                    
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
                .background(Color.gray.opacity(0.1))
                HStack
                {
                    TextField("Question or Request", text: $messageText)
                        .padding()
                        .background(Color("DarkBlue").opacity(0.2))
                        .cornerRadius(10)
                        .onSubmit
                        {
                            sendMessage(message: messageText)
                        }
                    Button{
                        sendMessage(message: messageText)
                    }label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(Color.blue)
                    }
                    .font(.system(size: 26))
                    .padding(.horizontal, 10)
                }
                .padding()
        }
        }
        .background(Color.black.opacity(0.05))
        .onAppear{
            viewModel.setup()
        }
        

    }
    /**
        This function will send the message to the OpenAI API and then recieve a response from the API and then display the response in the chat.
        It will also check if the user is asking for the assistant and if so it will send the message to the assistant.
        */
    func sendMessage(message : String)
    {
        print("imn")
        guard !message.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        withAnimation
        {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            withAnimation
            {
                let computer = getBotResponse(message: message)
                if(computer != "")
                {
                    messages.append(computer)
                }else
                {
                    viewModel.send(text: message){
                        response in
                        DispatchQueue.main.async {
                            self.messages.append(response)
                        }
                    }
                }
            }
        }
        
    }
    
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
