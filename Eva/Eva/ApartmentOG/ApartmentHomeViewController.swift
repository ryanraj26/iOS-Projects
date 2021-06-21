//
//  ApartmentHomeViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/27/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ApartmentHomeViewController: UIViewController {

    
    @IBOutlet weak var apartmentLbl: UILabel!
    @IBOutlet weak var roomieLbl: UILabel!
    @IBOutlet weak var tasksDeetLbl: UILabel!
    
    @IBOutlet weak var tasksTextView: UITextView!
    @IBOutlet weak var dayLbl: UILabel!
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    var Tasks = ""
    var today = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tabbar = tabBarController as! HomeTabBarViewController
        //weather()
        apartmentLbl.text = "\(tabbar.apartment.name), \(tabbar.apartment.number)"
        roomieLbl.text = tabbar.roomie.firstName
        self.Tasks = "\(tabbar.tasks)\n And you're done for today!🎉"
        
        var dateFormatter = DateFormatter()
        
        if Tasks == "" {
            Tasks = "You have no tasks today!😄"
            tasksDeetLbl.text = ""
        }else{
            dateFormatter.dateFormat = "MM/dd/yy"
            tasksDeetLbl.text = "Your tasks for today, \(dateFormatter.string(from: today)) are:"
            tasksTextView.text = Tasks
        }
        
        var formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        dayLbl.text = "Happy \(formatter.string(from: today))!"
        
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//                guard let homeViewController = mainStoryboard.instantiateViewController(identifier: "MapViewController") as? MapViewController else{
//                    return
//                }
//                homeViewController.apartment = apartment
               
       // todaysTasks()
        var maps = MapViewController()
        maps.getter(apartment: apartment)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logOutClicked(_ sender: Any) {
//        do {
//       try Auth.auth().signOut()
//                    
//    } catch {
//                 
//                    return
//                }
        performSegue(withIdentifier: "logOutSegue", sender: nil)
    }
    
    
  
    
    
    func weather(){
        let urlString1 = "http://dataservice.accuweather.com/currentconditions/v1/348735"

        let urlBuilder1 = URLComponents(string: urlString1)

        let url1 = urlBuilder1?.url
        var request1 = URLRequest(url: url1!)
        request1.httpMethod = "GET"
        request1.setValue("Glo2SmmlQnpAd0n0YzjknxJgybOrn2Pd", forHTTPHeaderField: "apikey")
        //request1.setValue("03923592baac5c2211609dc7d7fbed04", forHTTPHeaderField: "appid")

        URLSession.shared.dataTask(with: request1){(data,response,error) in
           // print(response)
            print(data)
            if error != nil {
                print(error!.localizedDescription)
            }
            do{
//                let newData = try JSONDecoder().decode(WelcomeElement.self, from: data!)
//                
//                DispatchQueue.main.async {
//                        do {
//                            
//                            ApartmentData.weatherMain = "\(newData.temperature.metric.unit)"
//                            ApartmentData.weatherDescription =  newData.weatherText
//                            print(newData.temperature.metric.unit)
//                            //print(main)
//                            //print(description)
//                            
//                        }catch{
//                            print(error)
//                        }
//                }
            }
            catch let parsingError{
                print(parsingError)
            }
        }.resume()

    }

    @IBAction func mapsClicked(_ sender: Any) {
        performSegue(withIdentifier: "mapSegue", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        let destinationVC = segue.destination as! MapViewController
//        destinationVC.apartment = self.apartment
//        
//        // Pass the selected object to the new view controller.
//    }
    

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
            tasksDeetLbl.text = ""
        }
        dateFormatter.dateFormat = "MM/dd/yy"
        tasksDeetLbl.text = "Your tasks for today \(dateFormatter.string(from: today)) are:"
        tasksTextView.text = tasks
    }
    
}
