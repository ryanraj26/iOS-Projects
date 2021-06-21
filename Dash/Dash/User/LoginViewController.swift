//
//  LoginViewController.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/6/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "ryan"
        passwordTextField.text = "ryan"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        var email = emailTextField.text!
        var password = passwordTextField.text!
        var flag = 0
        
        if email == "" || password == ""{
            showAlert(message: "Please input all values")
        }else{
            for item in UserData.users {
                if item.email.lowercased() == email.lowercased() && item.password.lowercased() == password.lowercased(){
                    UserData.currentUser = item
                    flag = 1
                    HomeViewController().currentUser(user: item)
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    guard let homeViewController = mainStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else{
                        return
                    }
                    navigationController?.pushViewController(homeViewController, animated: true)
                    //present(homeViewController, animated: true, completion: nil)
                }
            }
            if flag == 0{
                showAlert(message: "Enter Correct Credentials")
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
