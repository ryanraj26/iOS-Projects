//
//  PatientModel.swift
//  Assignment 5
//
//  Created by LMNTrix on 3/5/21.
//

import Foundation

class PatientModel{
    var firstName: String
    var lastName: String
    var NUID: Int
    var address: String
    var contact: String
    var email: String
    var password: String
    var status: String
    var testHistory:[String: String]
    
    init(firstName: String, lastName: String, address: String, contact: String, email: String, password: String){
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.contact = contact
        self.email = email
        NUID = Int.random(in: 1000000...9999999)
        self.password = password
        status = "NC"
        testHistory = [:]
    }
}
