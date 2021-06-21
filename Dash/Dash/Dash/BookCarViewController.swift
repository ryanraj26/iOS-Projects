//
//  BookCarViewController.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/7/21.
//

import UIKit

class BookCarViewController: UIViewController {
    
    

  

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var pickUpDate: UIDatePicker!
    @IBOutlet weak var dropOffDate: UIDatePicker!
    @IBOutlet weak var pickUpLbl: UILabel!
    @IBOutlet weak var dropOffLbl: UILabel!
    
    
    
    var manageCar = ManageAvailableCarsTableViewController()
    var pickupDateVar = Date()
    var pickupDateStr = ""
    var pickupTime = ""
    var dropoffDateVar = Date()
    var dropoffDateStr = ""
    var dropOffTime = ""
    var pickUpComplete = ""
    var dropOffComplete = ""
    var eligibleCars = [CarModel]()
    var carPos = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextField.text = "Boston"
        CarData.tempPickup = ""
        CarData.tempDropOff = ""
        CarData.tempArr.removeAll()
        
        //var date1 = Date(
        //pickUpDate.setDate(, animated: )
        //pickUpDate.datePickerMode = UIDatePicker.Mode.time
        //dropOffDate.datePickerMode = UIDatePicker.Mode.date
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        CarData.tempPickup = ""
        CarData.tempDropOff = ""
        CarData.tempArr.removeAll()
    }
    
    @IBAction func pickUpDateSelected(_ sender: Any) {
        //only date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        let dateString = dateFormatter.string(from: pickUpDate.date)
        pickupDateStr = dateString
        pickupDateVar = pickUpDate.date
        //dropOffLbl.text = dateString
        
        //only time
        let formatter2 = DateFormatter()
        formatter2.timeStyle = .short
        var timeStr = formatter2.string(from: pickUpDate.date)
        pickupTime = timeStr
        //pickUpLbl.text = "\(dateString), \(timeStr)"
        pickUpComplete = "\(dateString), \(timeStr)"
       // pickUpLbl.text = pickupDateStr
        //print(formatter2.string(from: pickUpDate))
        
        pickUpLbl.text = "\(dateString), \(timeStr)"
        
//        //let dateFormatter = DateFormatter()
//            //date and time
//            dateFormatter.dateStyle = DateFormatter.Style.short
//            dateFormatter.timeStyle = DateFormatter.Style.short
//
//            let strDate = dateFormatter.string(from: pickUpDate.date)
    }
    
    @IBAction func dropOffDateSelected(_ sender: Any) {
//        let dateFormatter = DateFormatter()
//
//            dateFormatter.dateStyle = DateFormatter.Style.short
//            dateFormatter.timeStyle = DateFormatter.Style.short
//
//            let strDate = dateFormatter.string(from: dropOffDate.date)
        //only date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        let dateString = dateFormatter.string(from: dropOffDate.date)
        dropoffDateStr = dateString
        dropoffDateVar = dropOffDate.date
        //dropOffLbl.text = dateString
        
        //only time
        let formatter2 = DateFormatter()
        formatter2.timeStyle = .short
        var timeStr = formatter2.string(from: dropOffDate.date)
        dropOffTime = timeStr
        //print(formatter2.string(from: pickUpDate))
        dropOffComplete = "\(dateString), \(timeStr)"
        
        dropOffLbl.text = "\(dateString), \(timeStr)"
    }
    
    @IBAction func searchBtnClicked(_ sender: Any) {
        //manageCar.getCars(cars: eligibleCars)
        manageCar.getTime(pickUp: pickUpLbl.text!, dropOff: dropOffLbl.text!)
        if pickUpLbl.text == "" || dropOffLbl.text == ""{
            showAlert(message: "Please choose the date and time")
        }else if dropoffDateVar < pickupDateVar{
            showAlert(message: "Enter correct dates")
        }else{
            //CarAvail()
            searchCars()
            var text = ""
            CarData.tempArr.removeAll()
            for item in eligibleCars {
                text += item.name
                CarData.tempArr.append(item.name)

            }
            CarData.tempPickup = pickUpComplete
            CarData.tempDropOff = dropOffComplete
            CarData.pickUpTime = pickupTime
            CarData.pickUpDate = pickupDateStr
            CarData.dropOffTime = dropOffTime
            //testLbl.text = text
            //ManageAvailableCarsTableViewController().getCarsPos(carPos: carPos)
            performSegue(withIdentifier: "showCars", sender: self)
        }
    }
    
    
    
    func searchCars(){
        var location = locationTextField.text!
        var posCar = 0
        var currPosCar = 0
        for item in CarData.cars {
            if item.owner != UserData.currentUser.firstName{
                if item.location == location{
                    posCar = currPosCar
                    var posPickUp = 0
                    var posDropOff = 0
                    if pickupDateStr == dropoffDateStr{
                        for item2 in item.availability {
                            if item2.key == pickupDateStr{
                                if item2.value.contains(pickupTime){
                                    posPickUp = item2.value.firstIndex(of: pickupTime)!
                                    posDropOff = item2.value.firstIndex(of: dropOffTime)!
                                }
                            }
                        }
                        var actualHrs : Int = Int(pickupDateVar.timeIntervalSince(dropoffDateVar))
                        actualHrs /= -3600
                        let expectedHrs : Int = posDropOff - posPickUp
                        if actualHrs == expectedHrs{
                            posCar = currPosCar
                            carPos.append(posCar)
                            eligibleCars.append(item)
                            CarData.tempURLS.append(posCar)
                            CarData.hrs = actualHrs
                        }
                    }//else{
    //                    for item3 in item.availability {
    //                        if item3.key == pickupDateStr{
    //
    //                        }
    //                    }
    //                }
                }else{
                    currPosCar += 1
                }
            }
            }
            //ManageAvailableCarsTableViewController().getCars(cars: eligibleCars)
    //        ManageAvailableCarsTableViewController().getCarsPos(carPos: carPos)
    //        ManageAvailableCarsTableViewController().getTime(pickUp: pickUpComplete, dropOff: dropOffComplete)
    //                var currposPickUp = 0
    //
    //                var currposDropOff = 0
    //                var posPickUpDate = 0
    //                var currposPickUpDate = 0
    //                var posDropOffDate = 0
    //                var currposDropOffDate = 0
    //                var totalHrs = 0
    //                for date in item.availability{
    //                    if date.key == pickupDateStr{
    //                        posPickUpDate = currposPickUpDate
    //                        for item2 in date.value {
    //                            if item2 == pickupTime{
    //                                posPickUp = currposPickUp
    //                            }else{
    //                                currposPickUp += 1
    //                            }
    //
    //                        }
    //
    //                    }else{
    //                        currposPickUpDate += 1
    //                    }
    //                }
    //                for date in item.availability {
    //                    if date.key == dropoffDateStr{
    //                        posDropOffDate = currposDropOffDate
    //                        for item2 in date.value {
    //                            if item2 == dropOffTime{
    //                                posDropOff = currposDropOff
    //                            }else{
    //                                currposDropOff += 1
    //                            }
    //                            if currposDropOff == date.value.count-1{
    //                                posDropOff = currposDropOff
    //                            }
    //                        }
    //                    }else{
    //                        currposDropOffDate += 1
    //                    }
    //                }
    //
    //                let keys = Array(item.availability.keys)
    //
    //                for item4 in posPickUpDate...posDropOffDate{
    //
    //                }
    //              }
    //            }
    //        }
        
    }
    
    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    
//    func matchesForRegexInText(regex: String!, text: String!) -> [String] {
//
//        let regex = NSRegularExpression(pattern: regex,
//            options: nil, error: nil)!
//        let nsString = text as NSString
//        let results = regex.matchesInString(text,
//            options: nil, range: NSMakeRange(0, nsString.length))
//            as! [NSTextCheckingResult]
//        return map(results) { nsString.substringWithRange($0.range)}
//    }

}


