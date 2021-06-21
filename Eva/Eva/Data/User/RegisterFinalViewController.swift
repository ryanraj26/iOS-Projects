//
//  RegisterFinalViewController.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/26/21.
//

import UIKit

class RegisterFinalViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var apartmentLbl: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    var segueID = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apartmentLbl.text = "\(apartment.name), \(apartment.number)"
        firstNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        lastNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        contactTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        //apartmentLbl.text = "Apartment"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func becomeARoomieClicked(_ sender: Any) {
        register()
    }
    
    
    
    func register(){
        var firstName = firstNameTextField.text!
        var lastName = lastNameTextField.text!
        var contact = contactTextField.text!
        var email = emailTextField.text!
        var password = passwordTextField.text!
        
        if firstName == "" || lastName == "" || contact == "" || email == "" || password == ""{
            showAlert(message: "I want to know all these things about you. Please dont leave out anything!")
        }else{
            if isValidEmail(email){
                var roomie = UserModel(firstName: firstName, lastName: lastName, contact: contact, email: email, password: password)
                apartment.roommates.append(roomie)
                self.roomie.firstName = firstName
                self.roomie.lastName = lastName
                self.roomie.contact = contact
                self.roomie.email = email
                self.roomie.password = password
                //showAlert(message: "Yayy! We're Roomies now!")
                segueID = "registerHomeSegue"
                segueIdentifier()
                //performSegue(withIdentifier: "registerHomeSegue", sender: nil)
            }else{
                showAlert(message: "Enter a valid email ID")
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        //shouldPerformSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        if segueID == "registerHomeSegue"{
            let destinationVC = segue.destination as! HomeTabBarViewController
            destinationVC.apartment = apartment
            destinationVC.roomie = roomie
        }else if segueID == "cancelSegue"{
            let destinationVC = segue.destination as! ViewController
//            destinationVC.apartment = apartment
//            destinationVC.roomie = roomie
        }
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        segueID = "cancelSegue"
        segueIdentifier()
        
    }
    
    func segueIdentifier(){
        performSegue(withIdentifier: "\(segueID)", sender: nil)
    }
    
    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
