//
//  BotResponse.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 12/22/22.
//

import Foundation
var count = 0
func getBotResponse(message: String) -> String
{
    let tempMessage = message.lowercased()
    
    if(count == 1)
    {
        count = 0
        return "Thank you for reporting this bug! A representitive will review it ASAP."
    }
    if tempMessage.contains("schedule")
    {
        if(tempMessage.contains("monday") || tempMessage.contains("tuesday") || tempMessage.contains("wednesday") || tempMessage.contains("thursday"))
        {
            return "PERIOD 1 OR 5: 7:45 – 9:01 | 76 Minutes \n APP: 9:07 – 9:44 | 37 Minutes \n PERIOD 2 OR 6: 9:50– 11:06 | 76 Minutes \n 1ST LUNCH: 11:06 – 11:36 | 30 Minutes \n PERIOD 3 OR 7: 11:42 –12:58 | 76 Minutes \n 2ND LUNCH: 12:28 – 12:58 | 30 Minutes \n PERIOD 3 OR 7: 11:12 – 12:28 | 76 Minutes \n PERIOD 4 OR 8: 1:04 – 2:20 | 76 Minutes"
        }else if (tempMessage.contains("friday"))
        {
            return "It will be an early out day! \n PERIOD 1 OR 5: 7:45 – 8:45 | 60 Minutes \n PERIOD 2 OR 6: 8:51 – 9:51 | 60 Minutes \n PERIOD 3 OR 7: 9:57 – 10:57 | 60 Minutes \n PERIOD 4 OR 8: 11:03 – 12:03 | 60 Minutes \n LUNCH: 12:03 – 12:43 | 40 Minutes \n PLC: 12:43 – 2:20 | 97 Minutes"
        }else if(tempMessage.contains("saturday") || tempMessage.contains("sunday"))
        {
            return "There is no school Sunday or Saturday, it's the weekend."
        }else
        {
            return "Schedule for which day? \n Please use the following as a inpout guide: \n \"DAY\" Schedule or Schedule \"DAY\""
        }
    }
    else if tempMessage.contains("report a bug")
    {
        count = 1
        return "Please provuide a detailed discription of the bug and we will fix it ASAP."
    }
    
    else  if tempMessage.contains("close")
    {
        return "Thank you for using the help desk!"
    }
    
    else
    {
        return "A assistant will be right with you! \n Current wait time: 7 minutes. \n If you would like to end your request or exit this conversation type \"Close\"."
    }
    
}


