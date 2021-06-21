//
//  RegisterViewController.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/25/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var apartmentNameTextField: UITextField!
    @IBOutlet weak var apartmentNumberTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    
    
    var apartment = ApartmentModel(name: "", number: "")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apartmentNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        apartmentNumberTextField.borderStyle = UITextField.BorderStyle.roundedRect
        apartmentNameTextField.text = "The Longwood"
        apartmentNumberTextField.text = "609"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addClicked(_ sender: Any) {
        add()
        print(ApartmentData.apartments.count)
        //RegisterFinalViewController().apartmentGetter(apartment: apartment)
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func add(){
        var apartmentName = apartmentNameTextField.text!
        var apartmentNumber = apartmentNumberTextField.text!
        var count = 0
        
        if apartmentName == "" || apartmentNumber == ""{
            showAlert(message: "Please enter all the values!")
        }else{
            for item in ApartmentData.apartments {
                if apartmentName == item.name && apartmentNumber == item.number{
                    self.apartment = item
                    //RegisterFinalViewController().apartment = item
                    //RegisterFinalViewController().apartmentGetter(apartment: item)
                }else{
                    count += 1
                }
            }
            if count == ApartmentData.apartments.count{
                var newApartment = ApartmentModel(name: apartmentName, number: apartmentNumber)
                ApartmentData.apartments.append(newApartment)
                //RegisterFinalViewController().apartmentGetter(apartment: newApartment)
                self.apartment = newApartment
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destinationVC = segue.destination as! RegisterFinalViewController
            destinationVC.apartment = apartment
        // Pass the selected object to the new view controller.
    }

    @IBAction func backClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
}
