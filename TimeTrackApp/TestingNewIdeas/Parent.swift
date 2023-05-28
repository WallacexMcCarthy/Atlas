//
//  Parent.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 5/28/23.
//

import Foundation
class Parent: User{
    var child: Student
    init(firstName: String, lastName: String, birthdate: String, child: Student){
        self.child = child
        super.init(firstName: firstName, lastName: lastName, birthdate: birthdate)
    }
    public func getChild() -> Student{
        return child
    }
}
