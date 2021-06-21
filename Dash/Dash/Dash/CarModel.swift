//
//  CarModel.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/7/21.
//

import Foundation

class CarModel{
    var owner : String
    var name : String
    var availability : [String:[String]]
    var location : String
    var cost : Double
    var imageURL : String = ""
    
    init(owner: String, name: String, availability: [String:[String]], location: String, cost: Double) {
        self.owner = owner
        self.name = name
        self.availability = availability
        self.location = location
        self.cost = cost
        
    }
}
