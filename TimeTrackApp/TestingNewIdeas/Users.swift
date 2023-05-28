//
//  Users.swift
//  TimeTrackApp
//
//  Created by Wallace McCarthy on 5/28/23.
//

import Foundation
class UserData <Type: AnyObject>{
    var users: [Type] = []
    public func addUser(user: Type){
        users.append(user)
    }
    public func getSize() -> Int{
        return users.count
    }
    public func getUser(index: Int) -> Type{
        return users[index]
    }
    public func removeUser(index: Int){
        users.remove(at: index)
    }
    public func removeUser(user: Type){
        for i in 0..<users.count{
            if(users[i] === user){
                users.remove(at: i)
            }
        }
    }
}
