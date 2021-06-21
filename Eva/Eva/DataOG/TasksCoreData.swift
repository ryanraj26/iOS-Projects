//
//  UserCoreData.swift
//  Eva
//
//  Created by LMNTrix on 4/30/21.
//

import Foundation
import CoreData
import UIKit

class TasksCoreData{
    
    func addTask(managedContext:NSManagedObjectContext) -> Tasks{
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)
        let taskEntity = NSEntityDescription.entity(forEntityName: "Tasks", in: managedContext)
        let task = NSManagedObject.init(entity: taskEntity!, insertInto: managedContext)
        
        var cooking : [String:Int] = [:]
        var dishwashing : [String:Int] = [:]
        var bathroomCleaning : [String:Int] = [:]
        var kitchenCleaning : [String:Int] = [:]
        
        task.setValue(cooking, forKey: "cooking")
        task.setValue(dishwashing, forKey: "dishwashing")
        task.setValue(bathroomCleaning, forKey: "bathroomCleaning")
        task.setValue(kitchenCleaning, forKey: "kitchenCleaning")
        
        
        saveContext(managedContext : managedContext)
        return task as! Tasks
        
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
    
    func getUsers(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Tasks>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tasks")
            let sortName = NSSortDescriptor(key: "cooking", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<Tasks>
    }
    
}
