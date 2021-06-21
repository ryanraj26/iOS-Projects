//
//  CalendarViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/27/21.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tasksTextView: UITextView!
    
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        var tabbar = tabBarController as! HomeTabBarViewController
        self.apartment = tabbar.apartment
        self.roomie = tabbar.roomie
        minimumDate(for: calendar)
        styleCalendar()
        
//        calendar.dataSource = self
//        calendar.delegate = self
        // Do any additional setup after loading the view.
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //dateLbl.text = "Hi"
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yy"
        let selectedDate = dateFormatter.string(from: date)
        //dateLbl.text = selectedDate
       // showAlert(message: selectedDate)
        var cookID : Int = apartment.tasks.cooking[selectedDate]!
        var dishwashingID : Int = apartment.tasks.dishwasher[selectedDate]!
        var cookName = apartment.roommates[cookID].firstName
        var dishwasherName = apartment.roommates[dishwashingID].firstName
        var tasks = "Cooking: \(cookName)\n \nDishwashing: \(dishwasherName)"
        dateFormatter.dateFormat = "EEEE"
        var day = dateFormatter.string(from: date)
        if day == "Saturday"{
            var kitchenCleaningID : Int = apartment.tasks.kitchenCleaning[selectedDate]!
            var kitchenCleaningName = apartment.roommates[kitchenCleaningID].firstName
            tasks += "\n\nKitchen: \(kitchenCleaningName)"
        }
        if day == "Sunday"{
            var bathroomCleaningID : Int = apartment.tasks.bathroomCleaning[selectedDate]!
            var bathroomCleaningName = apartment.roommates[bathroomCleaningID].firstName
            tasks += "\n\nBathroom: \(bathroomCleaningName)"
        }
        //showAlert(message: tasks)
        dateLbl.text = "The chores for \(selectedDate) are:"
        tasksTextView.text = tasks
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Tasks", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    func styleCalendar(){
        self.calendar.appearance.headerTitleFont      = UIFont.init(name: "Futura", size: 18)
        self.calendar.appearance.weekdayFont          = UIFont.init(name: "Futura", size: 16)
        self.calendar.appearance.titleFont            = UIFont.init(name: "Futura", size: 16)
        
//        self.calendar.appearance.headerTitleColor     = UIColor.NavTitleColor
//        self.calendar.appearance.weekdayTextColor     = Colors.topTabBarSelectedColor
//        self.calendar.appearance.eventDefaultColor    = Colors.NavTitleColor
//        self.calendar.appearance.selectionColor       = Colors.purpleColor
//        self.calendar.appearance.titleSelectionColor  = Colors.NavTitleColor
//        self.calendar.appearance.todayColor           = Colors.purpleColor
//        self.calendar.appearance.todaySelectionColor  = Colors.purpleColor
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "yyyy-MM-dd"
        let strCurrentDate = formatter.string(from: yourDate!)
        return formatter.date(from: strCurrentDate)!
    }
}
