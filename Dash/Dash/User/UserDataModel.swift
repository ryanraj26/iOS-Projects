//
//  UserDataModel.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/6/21.
//

import Foundation

class UserModel{
    var firstName : String
    var lastName : String
    var address : String
    var contact : String
    var email : String
    var password : String
    var history = [UserHistory]()
    var ownedCars = [OwnedCars]()

    init(firstName : String, lastName : String, address : String, contact : String, email : String, password : String){
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.contact = contact
        self.email = email
        self.password = password
        
    }
}
