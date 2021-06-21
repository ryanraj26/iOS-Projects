//
//  SupplierCoreData.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/27/21.
//

import Foundation
import CoreData
import UIKit

class SupplierCoreData{
    
    func addSupplier(name : String, address : String, email : String,  phone : String, quantity : Int,  managedContext:NSManagedObjectContext) -> Supplier{
        
        let supplierEntity = NSEntityDescription.entity(forEntityName: "Supplier", in: managedContext)
        let supplier = NSManagedObject.init(entity: supplierEntity!, insertInto: managedContext)
        
        let id = Int.random(in: 1000000...9999999)
        
        supplier.setValue(name, forKey: "name")
        supplier.setValue(id, forKey: "id")
        supplier.setValue(address, forKey: "address")
        supplier.setValue(phone, forKey: "phone")
        supplier.setValue(email, forKey: "email")
        supplier.setValue(quantity, forKey: "quantity")
        
        
        saveContext(managedContext : managedContext)
        return supplier as! Supplier
        
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
    
    func getSuppliers(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Supplier>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Supplier")
            let sortName = NSSortDescriptor(key: "id", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<Supplier>
    }
    
}
