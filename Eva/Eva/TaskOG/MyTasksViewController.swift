//
//  MyTasksViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/28/21.
//

import UIKit

class MyTasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var myTasksTable: UITableView!
    
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")

    
    var tasks = [[String]]()
    var tasksDate = [[Date]]()
    var tasksName = ["Cooking", "Dishwashing", "Kitchen Cleaning", "Bathroom Cleaning"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tabbar = tabBarController as! HomeTabBarViewController
        self.apartment = tabbar.apartment
        self.roomie = tabbar.roomie
        getMyTasks()
        myTasksTable.separatorStyle = .none
        myTasksTable.rowHeight = 45
        myTasksTable.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[section].count ?? 0
        //return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTasksTable.dequeueReusableCell(withIdentifier: "myTasks", for: indexPath) as! MyTasksTableViewCell
        
        cell.textLabel?.text = tasks[indexPath.section][indexPath.row]
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        tasksName[section]
//    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: myTasksTable.frame.width, height: 60))
        view.backgroundColor = UIColor.orange
        
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width-15, height: 30))
        lbl.text = tasksName[section]
        view.addSubview(lbl)
        return view
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            showAlert(message: "\(tasksName[indexPath.section]) done on \(tasks[indexPath.section][indexPath.row])")
            tasks[indexPath.section].remove(at: indexPath.row)
            myTasksTable.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    
    
    func getMyTasks(){
        for (x,y) in apartment.tasks.cooking {
            if roomie.firstName == apartment.roommates[y].firstName{
                roomie.myTasks.cooking.append(x)
            }
        }
        for (x,y) in apartment.tasks.dishwasher {
            if roomie.firstName == apartment.roommates[y].firstName{
                roomie.myTasks.dishwashing.append(x)
            }
        }
        for (x,y) in apartment.tasks.kitchenCleaning {
            if roomie.firstName == apartment.roommates[y].firstName{
                roomie.myTasks.kitchenCleaning.append(x)
            }
        }
        for (x,y) in apartment.tasks.bathroomCleaning {
            if roomie.firstName == apartment.roommates[y].firstName{
                roomie.myTasks.bathroomCleaning.append(x)
            }
        }
        tasks.append(roomie.myTasks.cooking)
        tasks.append(roomie.myTasks.dishwashing)
        tasks.append(roomie.myTasks.kitchenCleaning)
        tasks.append(roomie.myTasks.bathroomCleaning)
        tasks[0].reverse()
        tasks[1].reverse()
        tasks[2].reverse()
        tasks[3].reverse()
        
        
        //let dates = ["2020-06-23", "2021-06-24", "2022-06-25", "2020-06-26", "2020-06-29"]

        //create an empty array of dates
       // var datesFormated = [[Date()], [Date()], [Date()], [Date()]]
        var datesFormated1 = [Date]()
        var datesFormated2 = [Date]()
        var datesFormated3 = [Date]()
        var datesFormated4 = [Date]()
        
        let initialDateFormatter = DateFormatter()
        initialDateFormatter.dateFormat = "MM-dd-yy"

        for i in 0...3 {
            for j in tasks[i]{
                let date = initialDateFormatter.date(from: j)!
                //but you have to make sure that the date format of the strings match the date formatter, otherwise it will crash
                if i == 0{
                    datesFormated1.append(date)
                }
                if i == 1{
                    datesFormated2.append(date)
                }
                if i == 2{
                    datesFormated3.append(date)
                }
                if i == 3{
                    datesFormated4.append(date)
                }
            }
        }
        tasks[0].removeAll()
        tasks[1].removeAll()
        tasks[2].removeAll()
        tasks[3].removeAll()

        //then change the format to the one you need
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"

        
            for date in datesFormated1{
                let date = dateFormatter.string(from: date)
                tasks[0].append(date)
            }
            for date in datesFormated2{
                let date = dateFormatter.string(from: date)
                tasks[1].append(date)
            }
            for date in datesFormated3{
                let date = dateFormatter.string(from: date)
                tasks[2].append(date)
            }
            for date in datesFormated4{
                let date = dateFormatter.string(from: date)
                tasks[3].append(date)
            }
        
//        var ready = tasks[0].sorted(by: { $0.compare($1) == .orderedDescending })
//        print(ready)
        
        //let testArray = ["25 Jun, 2016", "30 Jun, 2016", "28 Jun, 2016", "2 Jul, 2016"]
//        var convertedArray: [Date] = []
//
//        var dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd MM, yyyy"
//        for i in 0...3{
//            for item in tasks[i] {
//                let date = dateFormatter.date(from: item)
//                tasksDate[i].append(date!)
//            }
//        }
        
//        tasksDate = tasksDate.sorted {$0 > $1}
//        dateFormatter.dateFormat = "dd MM, yyyy"// yyyy-MM-dd"
//
//        for i in 0...3{
//            for item in tasksDate[i]{
//
//            }
//        }
//        for j in 0...3{
//            for dat in tasksDate[i] {
//                let date = dateFormatter.date(from: dat)
//                if let date = date {
//                    convertedArray.append(date)
//                }
//            }
//        }
        
//        let df = DateFormatter()
//        df.dateFormat = "yyyy-MM-dd"
//        df.locale = Locale(identifier: "en_US_POSIX")
//        df.timeZone = TimeZone(identifier: "UTC")!
        
//        var sortedArray = [[Date]]()
//        for i in 0...3{
//            sortedArray.append(tasks[i].sorted {df.date(from: $0)! > df.date(from: $1)!})
//        }
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
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    
}
