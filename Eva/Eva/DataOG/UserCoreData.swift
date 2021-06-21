//
//  UserCoreData.swift
//  Eva
//
//  Created by LMNTrix on 4/30/21.
//

import Foundation
import CoreData
import UIKit

class UserCoreData{
    
    func addUser(id: Int, firstName : String, lastName : String, email : String,  contact : String, password: String, managedContext:NSManagedObjectContext) -> Users{
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)
        let myTaskEntity = NSEntityDescription.entity(forEntityName: "MyTask", in: managedContext)
        let user = NSManagedObject.init(entity: userEntity!, insertInto: managedContext)
        
        var cooking = [String]()
        var dishwashing = [String]()
        var kitchenCleaning = [String]()
        var bathroomCleaning = [String]()
        
        
        user.setValue(id, forKey: "id")
        user.setValue(firstName, forKey: "firstName")
        user.setValue(lastName, forKey: "lastName")
        user.setValue(contact, forKey: "contact")
        user.setValue(email, forKey: "email")
        user.setValue(password, forKey: "password")
        user.setValue(cooking, forKey: "cooking")
        user.setValue(dishwashing, forKey: "dishwashing")
        user.setValue(kitchenCleaning, forKey: "kitchenCleaning")
        user.setValue(bathroomCleaning, forKey: "bathroomCleaning")
        
        
        saveContext(managedContext : managedContext)
        return user as! Users
        
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
    
    func getUsers(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Users>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            let sortName = NSSortDescriptor(key: "id", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<Users>
    }
    
}
