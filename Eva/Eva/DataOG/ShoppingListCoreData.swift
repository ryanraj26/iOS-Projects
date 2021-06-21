//
//  UserCoreData.swift
//  Eva
//
//  Created by LMNTrix on 4/30/21.
//

import Foundation
import CoreData
import UIKit

class ShoppingListCoreData{
    
    func addShoppingListItem(product: String, quantity: String, managedContext:NSManagedObjectContext) -> ShoppingList{
        
        let shoppingListEntity = NSEntityDescription.entity(forEntityName: "ShoppingList", in: managedContext)
        
        let shoppingList = NSManagedObject.init(entity: shoppingListEntity!, insertInto: managedContext)
        
        
        shoppingList.setValue(product, forKey: "product")
        shoppingList.setValue(quantity, forKey: "quantity")
        
        
        
        saveContext(managedContext : managedContext)
        return shoppingList as! ShoppingList
        
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
    
    func getUsers(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<ShoppingList>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ShoppingList")
            let sortName = NSSortDescriptor(key: "product", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<ShoppingList>
    }
    
}
