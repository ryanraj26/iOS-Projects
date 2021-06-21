//
//  UserCoreData.swift
//  Eva
//
//  Created by LMNTrix on 4/30/21.
//

import Foundation
import CoreData
import UIKit

class MyTasksCoreData{
    
    func addMyTasks(cooking : [String], dishwashing : [String], kitchenCleaning : [String],  bathroomCleaning : [String],  managedContext:NSManagedObjectContext) -> MyTask{
        
        
        let myTaskEntity = NSEntityDescription.entity(forEntityName: "MyTask", in: managedContext)
        let myTasks = NSManagedObject.init(entity: myTaskEntity!, insertInto: managedContext)
        
        var cooking = [String]()
        var dishwashing = [String]()
        var kitchenCleaning = [String]()
        var bathroomCleaning = [String]()
        
        
        
        myTasks.setValue(cooking, forKey: "cooking")
        myTasks.setValue(dishwashing, forKey: "dishwashing")
        myTasks.setValue(kitchenCleaning, forKey: "kitchenCleaning")
        myTasks.setValue(bathroomCleaning, forKey: "bathroomCleaning")
        
        
        
        
        saveContext(managedContext : managedContext)
        return myTasks as! MyTask
        
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
    
    func getMyTasks(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<MyTask>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyTask")
            let sortName = NSSortDescriptor(key: "cooking", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<MyTask>
    }
    
}
