//
//  UserData.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/6/21.
//

import Foundation

class UserData{
    static var users = [UserModel]()
    static var pickUpDate = ""
    static var pickUpTime = ""
    static var dropOffTime = ""
    static var currentUser = UserModel(firstName: "", lastName: "", address: "", contact: "", email: "", password: "")
    
}
