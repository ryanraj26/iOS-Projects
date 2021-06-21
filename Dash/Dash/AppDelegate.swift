//
//  AppDelegate.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/5/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let token2 = tokenGenerate()
        print(token2)
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.blue
        let navigationFont = UIFont(name: "Futura", size: 12.0)
        //let navigationFontAttributes = [Font]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 19)!]
        
        var user = UserModel(firstName: "Ryan", lastName: "Raj", address: "1575 Tremont St", contact: "+18577018747", email: "ryan", password: "ryan")
        UserData.users.append(user)
        
        var carHrs = ["12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM", "12:00 AM"]
        
        var car1Avail : [String:[String]] = ["04/07/21":carHrs/*, "04/08/21":carHrs*/]
        var car2Avail : [String:[String]] = ["04/08/21":carHrs]
        
        var car1 = CarModel(owner: "Admin", name: "LMN", availability: car1Avail, location: "Boston", cost: 12.0)
        CarData.cars.append(car1)
        
        var car2 = CarModel(owner: "Admin", name: "TRIX", availability: car2Avail, location: "Boston", cost: 15.0)
        CarData.cars.append(car2)
        
        var s =  "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJwem5vRHdsYlNUcmFwM2FTQzdSUUl3anpzb2NJWGlaTUQ2cUxBakh5X0NVIn0.eyJqdGkiOiIxNmM3YWI4Mi03Yzc1LTRmODktYTZiYi0yNGVjNWFlZTA0NzYiLCJleHAiOjE2MTkzMDg1NTksIm5iZiI6MCwiaWF0IjoxNjE5MzAxNDE5LCJpc3MiOiJodHRwczovL3Nzby1zc28uYXBwcy5hcGktbnAuYWJnYXBpc2VydmljZXMuY29tL2F1dGgvcmVhbG1zLzNzY2FsZS1zdGFnaW5nLWFwaS1vaWRjIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImIzZTBlNWU3LTcyYzAtNDk0Ny04ZGM3LWIxYTkxOWNiNGNlYSIsInR5cCI6IkJlYXJlciIsImF6cCI6IjdhMzhhZTZjIiwiYXV0aF90aW1lIjowLCJzZXNzaW9uX3N0YXRlIjoiNzgyNmIyNWUtMWNhMS00NWE1LThiNzMtMzg3NThmZGMwZTNkIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoiZW1haWwgcHJvZmlsZSIsImNsaWVudEhvc3QiOiIxOC4xOTEuNzEuMjQ3IiwiY2xpZW50SWQiOiI3YTM4YWU2YyIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicHJlZmVycmVkX3VzZXJuYW1lIjoic2VydmljZS1hY2NvdW50LTdhMzhhZTZjIiwiY2xpZW50QWRkcmVzcyI6IjE4LjE5MS43MS4yNDcifQ.ALO2vmFZPZFabbFlQsRQgalxiIc1HwsD1S8XX0QfWDtlemysKFk2__BEUA5oez1C5GiJQkSBJhD68efKq8hbZHaID_nNo_eyw0yOI0AonOcMW_vHv6eroVtceFbnzI4FCdf0pl7laJ50ynFkt5KNGl4V1CIGPdlR0Pftvvo5d9krVJC6DFIU6Tj-gyRR6E0eyt-C2h0ygtq-ekiawtCy2nLaCxf5gZ0yW3afROQW3FNAqMMg1DwBtVGVwbzX4ZbbKJ8OrFHG0fKRj0pT-PhFy_0NJnXIkXVrzHhK2TQIPv6gUyFehQe4wHUksUFBOM15bjiGX1bFZbLyhDMEgxUSCw"
        let urlString1 = "https://stage.abgapiservices.com:443/cars/catalog/v1/vehicles?brand=Avis&pickup_date=2021-06-30T10%3A00%3A00&pickup_location=EWR&date_of_birth=1991-12-31&dropoff_date=2021-07-01T10%3A00%3A00&dropoff_location=EWR&country_code=US&transaction_id=23492034738"

        let urlBuilder1 = URLComponents(string: urlString1)

        let url1 = urlBuilder1?.url
        var request1 = URLRequest(url: url1!)
        request1.httpMethod = "GET"
        request1.setValue("7a38ae6c", forHTTPHeaderField: "client_id")
        request1.setValue("Bearer \(s)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request1){(data,response,error) in
           // print(response)
            print(data)
            if error != nil {
                print(error!.localizedDescription)
            }
            do{
                let newData = try JSONDecoder().decode(CarAvailModel.self, from: data!)
                
                DispatchQueue.main.async {
                        do {
                            for item in newData.vehicles{
                                var slot1 = ["12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM", "12:00 AM"]
                                var slot2 = ["12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM"]
                                                        
                                var car = CarModel(owner: "Admin", name: item.category.model, availability: ["04/24/21":slot1], location: "Boston", cost: Double(item.rateTotals.payLater.vehicleTotal))
                                car.imageURL = item.category.imageURL
                                CarData.cars.append(car)
                            }
                        }catch{
                            print(error)
                        }
                }
            }
            catch let parsingError{
                print(parsingError)
            }
        }.resume()

    
        
        // Override point for customization after application launch.
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

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Assignment_9")
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

    func tokenGenerate()->String{
        let urlString = "https://stage.abgapiservices.com/oauth/token/v1"
        let urlBuilder = URLComponents(string: urlString)

        let url = urlBuilder?.url
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("7a38ae6c", forHTTPHeaderField: "client_id")
        request.setValue("72ae2426ba3f812387f8d8957287cd8d", forHTTPHeaderField: "client_secret")
        var token = ""
        URLSession.shared.dataTask(with: request){(data,response,error) in
           // print(response)
            //print(data)
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else {return}
            
            do{
                let newData = try JSONDecoder().decode(TokenModel.self, from: data)
                
                DispatchQueue.main.async {
                        do {
                            //print(newData.accessToken)
                            token = newData.accessToken
                        }catch{
                            print(error)
                        }
                }
            }
            catch let parsingError{
                print(parsingError)
            }
            
            
        }.resume()
        print(token)
        return token
    }
}

