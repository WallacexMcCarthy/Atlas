//
//  Data.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 6/5/23.
//

import Foundation


private var canyonsDistrict = School(name: "Canyons School District", address: "1234")
private var wallace = Student(firstName: "Wallace", lastName: "McCarthy", birthdate: "09/12/2005", email: "wallacemccarthy@protonmail.com", password: "Wallacemccarthy1230!", studentNumber: 9485430, school: canyonsDistrict, grade: "12")
func loadUserData() -> [User]{
    var userItems : [User] = []
    userItems.append(wallace)
    userItems.append(Parent(firstName: "t", lastName: "t", birthdate: "t", email: "t", password: "t", child: wallace))
    userItems.append(Administrator(firstName: "a", lastName: "a", birthdate: "a", email: "a", password: "a", adminLogin: "a"))
    return userItems
}
