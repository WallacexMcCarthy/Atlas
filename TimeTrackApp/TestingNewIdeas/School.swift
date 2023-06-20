//
//  School.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 5/28/23.
//

import Foundation
class School{
    var name : String
    var address : String
    init(name: String, address: String){
        self.name = name
        self.address = address
    }
    public func getName() -> String{
        return name
    }
    public func getAddress() -> String{
        return address
    }
}
