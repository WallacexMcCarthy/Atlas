//
//  BotResponse.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 12/22/22.
//

import Foundation
func getBotResponse(message: String) -> String
{
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello")
    {
        return "Hey there!"
    }else  if tempMessage.contains("goodbye")
    {
        return "Tatlk to you later!"
    }else if tempMessage.contains("how are you")
    {
        return "Good how about you?"
    }else
    {
        return "Thats cool."
    }
}
