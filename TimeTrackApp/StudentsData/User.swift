//
//  User.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/22/22.
//

import Foundation

struct Users : Identifiable
{
    let id = UUID()
    let fullName: String
    let securityQuestion: String
    let securityAnswer: String
    let emailAddress: String
    let password: String
    let grade: Int
    let birthday: String
    let school: String
    let imageLinkSource: String
    
}
