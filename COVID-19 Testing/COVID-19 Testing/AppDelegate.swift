//
//  AppDelegate.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let schedulerService = SchedulerCoreData()
    let patientService = PatientCoreData()
    var managedContext : NSManagedObjectContext!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Override point for customization after application launch.
        /*var sup = SupplierModel(name: "Ryan", address: "1575 Tremont St.", phone: "8577018747", email: "ryan@gmail.com", quantity: 26)
        SupplierData.suppliers.append(sup)
        var patient = PatientModel(firstName: "Ryan", lastName: "Raj", address: "1575 Tremont St", contact: "+1(857)-701-8747", email: "ryan", password: "ryan")
        PatientData.patients.append(patient)
        
        var scheduleDay1 = ["8:00", "8:15", "8:45", "10:00", "14:00", "16:15"]
        var scheduleDay2 = ["9:00", "9:15", "9:45", "11:00", "15:00", "18:15"]
        
        var hist:[String:[String]] = ["Ryan":["07/03/21 09:00"]]
        SchedulerData.schedules.append(SchedulerModel(date: "03/07/21", schedule: scheduleDay1))
        SchedulerData.schedules.append(SchedulerModel(date: "03/08/21", schedule: scheduleDay2))
        */
        
        var scheduleDay1 = ["8:00", "8:15", "8:45", "10:00", "14:00", "16:15"]
        var scheduleDay2 = ["9:00", "9:15", "9:45", "11:00", "15:00", "18:15"]
        
        //var hist:[String:[String]] = ["Ryan":["07/03/21 09:00"]]
        SchedulerData.schedules.append(SchedulerModel(date: "03/07/21", schedule: scheduleDay1))
        SchedulerData.schedules.append(SchedulerModel(date: "03/08/21", schedule: scheduleDay2))
        let schedules = schedulerService.getSchedules(managedContext: managedContext).fetchedObjects
        if schedules!.count == 0{
            schedulerService.addScheduler(date: "03/07/21", schedule: scheduleDay1, managedContext: managedContext)
            schedulerService.addScheduler(date: "03/08/21", schedule: scheduleDay2, managedContext: managedContext)
            patientService
        }
        let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
        for i in schedules! {
            print(i.date)
        }
        return true
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "COVID19DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
}

