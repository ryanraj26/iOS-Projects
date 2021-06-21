//
//  RegisterViewController.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/6/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerClicked(_ sender: Any) {
        
        var firstName = firstNameTextField.text!
        var lastName = lastNameTextField.text!
        var address = addressTextField.text!
        var contact = contactTextField.text!
        var email = emailTextField.text!
        var password = passwordTextField.text!
        
        if firstName == "" || lastName == "" || address == "" || contact == "" || email == "" || password == "" {
            showAlert(message: "Please enter all values")
        }else{
        
            UserData.users.append(UserModel(firstName: firstName, lastName: lastName, address: address, contact: contact, email: email, password: password))
            //let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
//            guard let loginViewController = mainStoryboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else{
//                return
//            }
            
            //present(loginViewController, animated: true, completion: nil)
            performSegue(withIdentifier: "registeredSegue", sender: self)
        }
    }
    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    

}
