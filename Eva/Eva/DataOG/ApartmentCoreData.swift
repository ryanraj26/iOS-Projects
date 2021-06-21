//
//  UserCoreData.swift
//  Eva
//
//  Created by LMNTrix on 4/30/21.
//

import Foundation
import CoreData
import UIKit

class ApartmentCoreData{
    
    func addApartment(id: Int, name : String, number : String, managedContext:NSManagedObjectContext) -> Apartment{
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)
        let tasksEntity = NSEntityDescription.entity(forEntityName: "Tasks", in: managedContext)
        let shoppingListEntity = NSEntityDescription.entity(forEntityName: "ShoppingList", in: managedContext)
        let apartmentEntity = NSEntityDescription.entity(forEntityName: "Apartment", in: managedContext)
        let apartment = NSManagedObject.init(entity: apartmentEntity!, insertInto: managedContext)
        
        
        
        var roommates : [Int] = []
        var cookingDishwashingHistory : [Int] = []
        var kitchenHistory : [Int] = []
        var bathroomHistory : [Int] = []
        
        var shoppingList : [String:String] = [:]
        var cooking = [String:Int]()
        var dishwasher = [String:Int]()
        var bathroomCleaning = [String:Int]()
        var kitchenCleaning = [String:Int]()
        
        apartment.setValue(id, forKey: "id")
        apartment.setValue(name, forKey: "apartmentName")
        apartment.setValue(number, forKey: "apartmentNumber")
        apartment.setValue(roommates, forKey: "roommates")
        apartment.setValue(cookingDishwashingHistory, forKey: "cookingDishwasherHistory")
        apartment.setValue(kitchenHistory, forKey: "kitchenHistory")
        apartment.setValue(bathroomHistory, forKey: "bathroomHistory")
        apartment.setValue(cooking, forKey: "cooking")
        apartment.setValue(dishwasher, forKey: "dishwashing")
        apartment.setValue(bathroomCleaning, forKey: "bathroomCleaning")
        apartment.setValue(kitchenCleaning, forKey: "kitchenCleaning")
        apartment.setValue(shoppingList, forKey: "shoppingList")
        
        
        saveContext(managedContext : managedContext)
        return apartment as! Apartment
        
    }
    
    func saveContext (managedContext:NSManagedObjectContext) {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
                print("saved")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getApartments(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Apartment>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Apartment")
            let sortName = NSSortDescriptor(key: "id", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<Apartment>
    }
    
}
