//
//  SchedulerCoreData.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/28/21.
//

import Foundation
import CoreData
import UIKit

class SchedulerCoreData{
    
    func addScheduler(date: String, schedule: [String], managedContext:NSManagedObjectContext) -> Scheduler{
        
        let schedulerEntity = NSEntityDescription.entity(forEntityName: "Scheduler", in: managedContext)
        let scheduler = NSManagedObject.init(entity: schedulerEntity!, insertInto: managedContext)
        
        let nuid = Int.random(in: 10000...99999)
        
        scheduler.setValue(date, forKey: "date")
        scheduler.setValue(schedule, forKey: "schedule")
        
        
        
        saveContext(managedContext : managedContext)
        return scheduler as! Scheduler
        
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
    
    func getSchedules(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Scheduler>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scheduler")
            let sortName = NSSortDescriptor(key: "date", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<Scheduler>
    }
    
}
