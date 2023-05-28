//
//  User.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 5/28/23.
//

import Foundation
class User{
    var firstName : String
    var lastName : String
    var birthdate : String
    
    init(firstName: String, lastName: String, birthdate: String){
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
    }
    
    public func getFirstName() -> String{
        return firstName
    }
    public func getLastName() -> String{
        return lastName
    }
    public func getBirthdate() -> String{
        return birthdate
    }
}
