//
//  UserData.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/22/22.
//

import Foundation

/*
 It calls the data file Users and uses the variabels creeated there to make an array and it will return an array that has new information. 
 */
//struct Users : Identifiable
var currentUserIndexValue = -1

func loadUserData() -> [Users]
{
    // creates an array of the struct Users
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
        "T",
        "H"
    ]
    
    let password: [String] =
    [
        "dino",
        "t",
        "h"
    ]
    
    let grade: [String] =
    [
        "11",
        "11",
        "11"
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
        "profilepicDheeraj",
        "link",
        "link"
    ]
    // for loop that will add the data to the array
    for index in 0 ..< 3
    {
       
        userItems.append(Users(fullName: fullName[index], securityQuestion: securityQuestion[index], securityAnswer: securityAnswer[index], emailAddress: emailAddress[index], password: password[index], grade: grade[index], birthday: birthday[index], school: school[index], imageLinkSource: imageLinkSource[index]))
        userItems.append(Users(fullName: CreateAccountView().fullName, securityQuestion: CreateAccountView().securityQuestion, securityAnswer: CreateAccountView().securityAnswer, emailAddress: CreateAccountView().emailAddress, password: CreateAccountView().password, grade: CreateAccountView().grade, birthday: CreateAccountView().birthdate, school: CreateAccountView().school, imageLinkSource: CreateAccountView().imageLink))
    }
    
    return userItems
}

func loadCurrentUserData() -> [CurrentUsers]
{
    var currentUserInformation : [CurrentUsers] = []

    let fullName : [String] =
    [
        " "
    ]
    
    let securityQuestion : [String] =
    [
       " "
    ]
    
    let securityAnswer : [String] =
    [
        " "
    ]
    
    let emailAddress: [String] =
    [
        " "
    ]
    
    let password: [String] =
    [
        " "
    ]
    
    let grade: [String] =
    [
        " "
    ]
    
    let birthday: [String] =
    [
        " "
    ]
    
    let school: [String] =
    [
        " "
    ]
    
    let imageLinkSource: [String] =
    [
        " "
    ]
    
    for index in 0 ..< fullName.count
    {
        
        currentUserInformation.append(CurrentUsers(fullName: fullName[index], securityQuestion: securityQuestion[index], securityAnswer: securityAnswer[index], emailAddress: emailAddress[index], password: password[index], grade: grade[index], birthday: birthday[index], school: school[index], imageLinkSource: imageLinkSource[index]))
    }
    return currentUserInformation
}
