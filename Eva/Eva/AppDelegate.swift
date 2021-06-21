//
//  AppDelegate.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/25/21.
//

import UIKit
import Firebase
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let userService = UserCoreData()
    let apartmentService = ApartmentCoreData()
    let shoppingListService = ShoppingListCoreData()
    var managedContext : NSManagedObjectContext!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        
        var apartment1 = ApartmentModel(name: "The Longwood", number: "609")
        var apartment2 = ApartmentModel(name: "1167 Boylston St", number: "29")


        var user1 = UserModel(firstName: "Ryan", lastName: "Raj", contact: "8577018747", email: "ryan@gmail.com", password: "ryan1234")
        UserData.users.append(user1)
        apartment1.roommates.append(user1)
        var user2 = UserModel(firstName: "Nupur", lastName: "Gupte", contact: "8577018747", email: "nupur@gmail.com", password: "ryan")
        UserData.users.append(user2)
        apartment1.roommates.append(user2)
        var user3 = UserModel(firstName: "Divyank", lastName: "Jain", contact: "8577018747", email: "dj@gmail.com", password: "ryan")
        UserData.users.append(user3)
        apartment1.roommates.append(user3)
        var user4 = UserModel(firstName: "Vikram", lastName: "Kamath", contact: "8577018747", email: "vikram@gmail.com", password: "ryan")
        UserData.users.append(user4)
        apartment1.roommates.append(user4)


        var list1 = ShoppingListModel(product: "Milk", quantity: "1 gallon")
        var list2 = ShoppingListModel(product: "Eggs", quantity: "1 dozen")
        var list3 = ShoppingListModel(product: "Bread", quantity: "1 loaf")

        apartment1.shoppingList.append(list1)
        apartment1.shoppingList.append(list2)
        apartment1.shoppingList.append(list3)
        ApartmentData.apartments.append(apartment1)
        ApartmentData.apartments.append(apartment2)
        
//        let users = userService.getUsers(managedContext: managedContext).fetchedObjects
//        let apartments = apartmentService.getApartments(managedContext: managedContext).fetchedObjects
//        print(users?.count)
//        if users?.count == 0{
//           var id = 0
//            userService.addUser(id: id, firstName: "Ryan", lastName: "Raj", email: "ryan@gmail.com", contact: "8577018747", password: "ryan", managedContext: managedContext)
//            id += 1
//            userService.addUser(id: id, firstName: "Nupur", lastName: "Gupte", email: "nupur@gmail.com", contact: "8572962631", password: "ryan", managedContext: managedContext)
//            id += 1
//            userService.addUser(id: id, firstName: "Divyank", lastName: "Jain", email: "dj@gmail.com", contact: "8578993645", password: "ryan", managedContext: managedContext)
//            id += 1
//            userService.addUser(id: id, firstName: "Vikram", lastName: "Kamath", email: "vikram@gmail.com", contact: "8572962631", password: "ryan", managedContext: managedContext)
//
//
//            apartmentService.addApartment(id: apartments!.count, name: "The Longwood", number: "609", managedContext: managedContext)
//
//           // var apa : Apartment = apartments![apartments!.count]
////            var sL : ShoppingList = shoppingListService.addShoppingListItem(product: "Milk", quantity: "1 Gallon", managedContext: managedContext)
////            var sL1 : ShoppingList = shoppingListService.addShoppingListItem(product: "Eggs", quantity: "1 dozen", managedContext: managedContext)
////            var sL2 : ShoppingList = shoppingListService.addShoppingListItem(product: "Bread", quantity: "1 loaf", managedContext: managedContext)
////            apa.shoppingList?.append(sL)
////            apa.shoppingList?.append(sL1)
////            apa.shoppingList?.append(sL2)
//        }
//        for item in users! {
//            if item.id == 4{
//                break
//            }
//            apartments![0].roommates?.append(Int(item.id))
//        }
//        for item in users! {
//            print(item.id)
//        }
//        print(apartments?.count)
//        print("Above is number of apartments")
//        for item in apartments! {
//            print(item.apartmentName)
//            for i in 0...3{
//                print(users?[(item.roommates?[i])!].firstName)
//                //print(item.roommates?[i])
//            }
////            for i in 0...2{
////                print(item.shoppingList![i].product)
////            }
//        }
        
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "EvaDataModel")
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

