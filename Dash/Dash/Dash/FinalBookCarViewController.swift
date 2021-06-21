//
//  FinalBookCarViewController.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/8/21.
//

import UIKit



class FinalBookCarViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var pickUpLbl: UILabel!
    @IBOutlet weak var dropOffLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var cost = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = CarData.tempArr[myIndex]
        locationLbl.text = "Boston"
        var dateFormatter = DateFormatter()
        //var a = Int(dateFormatter.date(from: CarData.tempPickup)!.timeIntervalSince(dateFormatter.date(from: CarData.tempDropOff)!))
        for item in CarData.cars {
            if item.name == CarData.tempArr[myIndex]{
                cost = "$\(String(Double(CarData.hrs) * item.cost))"
                costLbl.text = cost
            }
        }
        pickUpLbl.text = CarData.tempPickup
        dropOffLbl.text = CarData.tempDropOff
        imageView.image = UIImage(named: CarData.tempArr[myIndex] + ".jpg")
        for item in CarData.cars {
            if nameLbl.text == item.name {
                imageView.load(url: item.imageURL)
            }
        }
       // imageView.load(url: CarData.cars[CarData.tempURLS[myIndex]].imageURL)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookClicked(_ sender: Any) {
        book()
    }
    
    func book(){
        var deleteIndices = [Int]()
        var carPos = 0
        var currpos = 0
        for item in CarData.cars {
            if item.name == nameLbl.text{
                carPos = currpos
                for item2 in item.availability{
                    if item2.key == CarData.pickUpDate{
                        var startIndex = item2.value.firstIndex(of: CarData.pickUpTime)!
                        for item3 in startIndex...startIndex+CarData.hrs {
                            deleteIndices.append(item3)
                        }
                    }
                }
            }else{
                currpos += 1
            }
            //var values = CarData.cars[carPos].availability[CarData.pickUpDate]
            for item4 in deleteIndices {
                //CarData.cars[carPos].availability[CarData.pickUpDate]!.remove(at: item4)
            }
        }
        //UserData.currentUser.bookings.append("\(CarData.tempArr[myIndex])  \(CarData.pickUpDate)  \(CarData.pickUpTime)   \(CarData.dropOffTime)")
        UserData.currentUser.history.append(UserHistory(carName: (CarData.tempArr[myIndex]), pickUpDate: CarData.pickUpDate, pickUpTime: CarData.pickUpTime, dropOffTime: CarData.dropOffTime, cost: cost))
        performSegue(withIdentifier: "bookedSegue", sender: self)
        showAlert(message: "Car Booked for \(CarData.pickUpDate) from \(CarData.pickUpTime) to \(CarData.dropOffTime)")
        
    }
    
    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
