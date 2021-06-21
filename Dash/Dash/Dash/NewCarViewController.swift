//
//  NewCarViewController.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/8/21.
//

import UIKit

class NewCarViewController: UIViewController {

    @IBOutlet weak var carNameTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var dateAvailalbleTextField: UITextField!
    @IBOutlet weak var slot1Btn: UIButton!
    @IBOutlet weak var slot2Btn: UIButton!
    
    var slot = [String]()
    var availibility = [String:[String]]()
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func slot1Clicked(_ sender: Any) {
        var carHrs = ["12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM", "12:00 AM"]
        slot = carHrs
        flag = 1
        slot1Btn.backgroundColor = UIColor.green
        slot2Btn.backgroundColor = UIColor.blue
    }
    
    @IBAction func slot2Clicked(_ sender: Any) {
        var carHrs = ["12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM"]
        slot = carHrs
        flag = 1
        slot2Btn.backgroundColor = UIColor.green
        slot1Btn.backgroundColor = UIColor.blue
    }
    @IBAction func addAvailibilityClicked(_ sender: Any) {
        var date = dateAvailalbleTextField.text!
        availibility[date] = slot
    }
    
    @IBAction func addCarClicked(_ sender: Any) {
        var name = carNameTextField.text!
        var cost = costTextField.text!
        
        if name == "" || cost == "" || dateAvailalbleTextField.text == ""{
            showAlert(message: "You need to input all values")
        }else{
            if flag == 0{
                showAlert(message: "You need to choose a slot")
            }else{
                UserData.currentUser.ownedCars.append(OwnedCars(carName: name, cost: cost))
                CarData.cars.append(CarModel(owner: UserData.currentUser.firstName, name: name, availability: availibility, location: "Boston", cost: Double(cost)!))
                availibility = [String:[String]]()
                carNameTextField.text = ""
                costTextField.text = ""
                dateAvailalbleTextField.text = ""
                showAlert(message: "\(name) has been added to the fleet!")
            }
        }
    }
    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
}
