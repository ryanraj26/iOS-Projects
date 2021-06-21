//
//  UserDataModel.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/25/21.
//

import Foundation

class UserModel{
    var ID : Int
    var firstName : String
    var lastName : String
    var contact : String
    var email : String
    var password : String
    
    init(firstName : String, lastName : String, contact : String, email : String, password : String){
        self.firstName = firstName
        self.lastName = lastName
        self.contact = contact
        self.email = email
        self.password = password
        ID = UserData.users.count
    }
}
