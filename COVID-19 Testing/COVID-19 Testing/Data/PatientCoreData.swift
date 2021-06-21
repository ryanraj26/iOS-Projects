//
//  PatientCoreData.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/27/21.
//

import Foundation
import CoreData
import UIKit

class PatientCoreData{
    
    func addPatient(firstName : String, lastName : String, address : String, email : String,  contact : String, password: String, managedContext:NSManagedObjectContext) -> Patient{
        
        let supplierEntity = NSEntityDescription.entity(forEntityName: "Patient", in: managedContext)
        let patient = NSManagedObject.init(entity: supplierEntity!, insertInto: managedContext)
        
        let nuid = Int.random(in: 10000...99999)
        
        let hist : [String:String] = [:]
        
        patient.setValue(firstName, forKey: "firstName")
        patient.setValue(lastName, forKey: "lastName")
        patient.setValue(nuid, forKey: "nuid")
        patient.setValue(address, forKey: "address")
        patient.setValue(contact, forKey: "contact")
        patient.setValue(email, forKey: "email")
        patient.setValue(password, forKey: "password")
        patient.setValue(hist, forKey: "testHistory")
        
        
        saveContext(managedContext : managedContext)
        return patient as! Patient
        
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
    
    func getPatients(managedContext:NSManagedObjectContext) -> NSFetchedResultsController<Patient>{
    
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Patient")
            let sortName = NSSortDescriptor(key: "nuid", ascending: true)
            fetchRequest.sortDescriptors = [sortName]
        
            let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
            do{
                try fetchedResultsController.performFetch()
            }catch let error as NSError{
                print("Error :\(error.userInfo)")
            }
    
            return fetchedResultsController as! NSFetchedResultsController<Patient>
    }
    
}
