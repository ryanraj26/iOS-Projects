//
//  ApartmentModel.swift
//  Eva
//
//  Created by LMNTrix on 4/27/21.
//

import Foundation

class ApartmentModel{
    
    var name : String
    var number : String
    var roommates : [UserModel]
    var shoppingList : [ShoppingListModel]
    var tasks = TaskModel()
    var CDhistory = [Int]()
    var kitchenHistory = [Int]()
    var bathroomHistroy = [Int]()
    
    
    init(name: String, number: String){
        self.name = name
        self.number = number
        roommates = []
        shoppingList = []
    }
}
