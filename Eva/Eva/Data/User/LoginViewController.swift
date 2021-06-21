//
//  LoginViewController.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/25/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var apartmentNameTextField: UITextField!
    @IBOutlet weak var apartmentNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    var apartment = ApartmentModel(name: "", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apartmentNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        apartmentNumberTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        apartmentNameTextField.text = "The Longwood"
        apartmentNumberTextField.text = "609"
        emailTextField.text = "ryan@gmail.com"
        passwordTextField.text = "ryan"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        login()
        
    }
    
    func login(){
        var apartmentName = apartmentNameTextField.text!
        var apartmentNumber = apartmentNumberTextField.text!
        var email = emailTextField.text!
        var password = passwordTextField.text!
        
        var count = 0
       
        if apartmentNumber == "" || apartmentName == "" || email == "" || password == ""{
                showAlert(message: "Please enter values in all fields!")
            }else if isValidEmail(email){
                for item in ApartmentData.apartments {
                    if apartmentName == item.name && apartmentNumber == item.number{
                        self.apartment = item
                        for item2 in item.roommates {
//                            if !isValidEmail(email){
//                                showAlert(message: "Enter a valid email address!")
//                            }else{
                            if email.lowercased() == item2.email.lowercased() && password.lowercased() == item2.password.lowercased(){
                                
                                self.roomie = item2
                                
                                performSegue(withIdentifier: "loginHomeSegue", sender: nil)
                                
                            }else{
                                count += 1
                            }
                        //}
                    }
                }
                    if count == item.roommates.count{
                        showAlert(message: "The credentials you have entered are not for this apartment")
                    }
            }
            }else{
                showAlert(message: "Enter a valid email address!")
            }
       
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destinationVC = segue.destination as! HomeTabBarViewController
        
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        guard let homeViewController = mainStoryboard.instantiateViewController(identifier: "HomeTabBarViewController") as? HomeTabBarViewController else{
//            return
//        }
//        homeViewController.apartment = apartment
//        homeViewController.roomie = roomie

        //var vc = homeViewController.tabBarController!.viewControllers![0] as! ApartmentHomeViewController
       // vc.apartment = apartment
       // vc.roomie = roomie
        destinationVC.apartment = apartment
        destinationVC.roomie = roomie
        
//        destinationVC.tabBarController?.selectedIndex = 0
//        var navVC = destinationVC.tabBarController?.viewControllers![0] as! ApartmentHomeViewController
//
//
//        let cartTableViewController = navVC.presentedViewController as! ApartmentHomeViewController
//
//        cartTableViewController.apartment = apartment
//        cartTableViewController.roomie = roomie
        // Pass the selected object to the new view controller.
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
