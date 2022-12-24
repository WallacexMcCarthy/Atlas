//
//  User.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 9/22/22.
//

import Foundation

/* craates all fo the variabels taht will be used in the array, simmilar to a database.
 I am currently trying to impliemnt Core Data or SQLite to remove the rudendancies of these files and data.
 */

struct Users : Identifiable
{
    // creates a origional id every time every time it is used / called.
    let id = UUID()
    let fullName: String
    let securityQuestion: String
    let securityAnswer: String
    let emailAddress: String
    let password: String
    let grade: String
    let birthday: String
    let school: String
    let imageLinkSource: String
    
}
struct CurrentUsers : Identifiable
{
    // creates a origional id every time every time it is used / called.
    let id = UUID()
    var fullName: String
    var securityQuestion: String
    var securityAnswer: String
    var emailAddress: String
    var password: String
    var grade: String
    var birthday: String
    var school: String
    var imageLinkSource: String
    
}
