//
//  UserData.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/22/22.
//

import Foundation

func loadUserData() -> [Users]
{
    var userItems : [Users] = []
    
    let fullName : [String] =
    [
        "Dheeraj Vislawath",
        "Wallace McCarthy",
        "Thomas Lu"
    ]
    
    let securityQuestion : [String] =
    [
        "What is your favorite color?",
        "What year was your first rock climbing nationals?",
        "What is your favorite sports team?"
    ]
    
    let securityAnswer : [String] =
    [
        "Blue",
        "2022",
        "Liverpool"
    ]
    
    let emailAddress: [String] =
    [
        "Vislawath.21@gmail.com",
        "t",
        "h"
    ]
    
    let password: [String] =
    [
        "dino",
        "t",
        "h"
    ]
    
    let grade: [Int] =
    [
        11,
        11,
        11
    ]
    
    let birthday: [String] =
    [
        "02/24/06",
        "09/12/05",
        "10/24/05"
    ]
    
    let school: [String] =
    [
        "Hillcrest",
        "Hillcrest",
        "Hillcrest"
    ]
    
    let imageLinkSource: [String] =
    [
        "link",
        "link",
        "link"
    ]
    
    for index in 0 ..< 3
    {
       
        userItems.append(Users(fullName: fullName[index], securityQuestion: securityQuestion[index], securityAnswer: securityAnswer[index], emailAddress: emailAddress[index], password: password[index], grade: grade[index], birthday: birthday[index], school: school[index], imageLinkSource: imageLinkSource[index]))
    }
    
    return userItems
}
