//
//  UserHistoryModel.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/8/21.
//

import Foundation

class UserHistory{
    var carName : String
    var pickUpDate : String
    var pickUpTime : String
    var dropOffTime : String
    var cost : String
    
    init(carName: String, pickUpDate: String, pickUpTime: String, dropOffTime: String, cost: String) {
        self.carName = carName
        self.pickUpDate = pickUpDate
        self.pickUpTime = pickUpTime
        self.dropOffTime = dropOffTime
        self.cost = cost
    }
}
