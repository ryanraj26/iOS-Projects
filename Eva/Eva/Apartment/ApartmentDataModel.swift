//
//  ApartmentDataModel.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/25/21.
//

import Foundation

class ApartmentModel{
    var name : String
    var number : String
    var roommates : [UserModel]
    var shoppingList : [String]
    var tasks = TaskModel()
    var CDhistory = [String]()
    var kitchenHistory = [String]()
    var bathroomHistroy = [String]()
    
    
    init(name: String, number: String){
        self.name = name
        self.number = number
        roommates = []
        shoppingList = []
    }
}
