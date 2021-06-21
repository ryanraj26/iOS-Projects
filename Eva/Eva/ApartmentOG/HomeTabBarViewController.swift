//
//  HomeTabBarViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/27/21.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    
    @IBOutlet weak var apartmentLbl: UILabel!
    @IBOutlet weak var roomieLbl: UILabel!
    
    
    //var homeVC: ApartmentHomeViewController! //First child
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    var tasks = ""
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(apartment.shoppingList.count) items")
        count += 1
        if count == 1{
            taskManagement()
        }
        if apartment.tasks.cooking.count == 0{
            taskManagement()
        }
        print("\(apartment.tasks.cooking.count) cooking")
        todaysTasks()
        ApartmentData.currentApartment = apartment
//        var vc = self.tabBarController!.viewControllers![0] as! ApartmentHomeViewController
//        vc.apartment = apartment
//        vc.roomie = roomie
//        apartmentLbl.text = "\(apartment.name), \(apartment.number)"
//        roomieLbl.text = roomie.firstName
        //homeVC = self.viewControllers![0] as! ApartmentHomeViewController
        // Do any additional setup after loading the view.
    }
    
    

    
    // MARK: - Navigation

//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        homeVC.apartment = apartment
//        homeVC.roomie = roomie
//    }
//
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        var vc = self.tabBarController!.viewControllers![0] as! ApartmentHomeViewController
//        vc.apartment = apartment
//        vc.roomie = roomie
//        // Pass the selected object to the new view controller.
//    }
    
    func taskManagement(){
        var date = Date()
        var formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        var day = formatter.string(from: date)
        print(day)
        var count = 0
        var id : Int = 0
        var id2 : Int  = 0
        var id3 : Int  = 0
        while count != 45{
            formatter.dateFormat = "MM-dd-yy"
            var strDate = formatter.string(from: date)
            formatter.dateFormat = "EEEE"
            var day = formatter.string(from: date)
            if day == "Saturday"{
                if apartment.kitchenHistory.count == 0{
                    id2 = 0
                    apartment.tasks.kitchenCleaning[strDate] = id2
                    apartment.kitchenHistory.append(id2)
                    id2 = (id2+1)%apartment.roommates.count
                }else{
                    id2 = ((apartment.kitchenHistory[apartment.kitchenHistory.count-1]+1) % (apartment.roommates.count))
                    apartment.tasks.kitchenCleaning[strDate] = id2
                    apartment.kitchenHistory.append(id2)
                    id2 = (id2+1)%apartment.roommates.count
                }
            }
            if day == "Sunday"{
                if apartment.bathroomHistroy.count == 0{
                    if apartment.roommates.count > 1 {
                        id3 = 1
                    }
                    apartment.tasks.bathroomCleaning[strDate] = id3
                    apartment.bathroomHistroy.append(id3)
                    id3 = (id3+1)%apartment.roommates.count
                }else{
                    id3 = ((apartment.bathroomHistroy[apartment.bathroomHistroy.count-1]+1) % (apartment.roommates.count))
                    apartment.tasks.bathroomCleaning[strDate] = id3
                    apartment.bathroomHistroy.append(id3)
                    id3 = (id3+1)%apartment.roommates.count
                }
            }
            if apartment.CDhistory.count == 0{
                id = 0
                apartment.tasks.cooking[strDate] = id
                apartment.CDhistory.append(id)
                id = (id+1)%apartment.roommates.count
                apartment.tasks.dishwasher[strDate] = id
                apartment.CDhistory.append(id)
                id = (id+1)%apartment.roommates.count
            }else{
                id = ((apartment.CDhistory[apartment.CDhistory.count-1]) % (apartment.roommates.count))
                apartment.tasks.cooking[strDate] = id
                apartment.CDhistory.append(id)
                id = (id + 1) % (apartment.roommates.count)
                apartment.tasks.dishwasher[strDate] = id
                apartment.CDhistory.append(id)
                id = (id + 1) % (apartment.roommates.count)
            }
            count += 1
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        }
        print(apartment.tasks.bathroomCleaning.count)
        print("_________________")
        print(apartment.tasks.kitchenCleaning.count)
    }

    
    
    func todaysTasks(){
        var tasks = ""
        var dateFormatter = DateFormatter()
        var date = Date()
        dateFormatter.dateFormat = "MM-dd-yy"
        for (x,y) in apartment.tasks.cooking {
            if x == dateFormatter.string(from: date){
                if roomie.firstName == apartment.roommates[y].firstName{
                    tasks += "Cooking \n"
                }
            }
        }
        for (x,y) in apartment.tasks.dishwasher {
            if x == dateFormatter.string(from: date){
                if roomie.firstName == apartment.roommates[y].firstName{
                    tasks += "Dishwashing \n"
                }
            }
        }
        for (x,y) in apartment.tasks.kitchenCleaning {
            if x == dateFormatter.string(from: date){
                if roomie.firstName == apartment.roommates[y].firstName{
                    tasks += "Kitchen Cleaning \n"
                }
            }
        }
        for (x,y) in apartment.tasks.bathroomCleaning {
            if x == dateFormatter.string(from: date){
                if roomie.firstName == apartment.roommates[y].firstName{
                    tasks += "Bathroom Cleaning \n"
                }
            }
        }
        if tasks == "" {
            tasks = "You have no tasks today!😄"
            //tasksDeetLbl.text = ""
        }
        dateFormatter.dateFormat = "MM/dd/yy"
       // tasksDeetLbl.text = "Your tasks for today \(dateFormatter.string(from: today)) are:"
        //tasksTextView.text = tasks
        self.tasks = tasks
    }
    
}
