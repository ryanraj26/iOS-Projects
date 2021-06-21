//
//  PatientRegisterViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class PatientRegisterViewController: UIViewController {
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var contactInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    var managedContext : NSManagedObjectContext!
    let patientService = PatientCoreData()
    let patient = Patient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
    }

    @IBAction func registerBtnClicked(_ sender: Any) {
        var flag = checkCredentials()
        if flag == 1{
            let loginPatient = PatientLoginViewController(nibName: "PatientLoginViewController", bundle: nil)
            self.present(loginPatient, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func checkCredentials()->Int{
        var email = emailInput.text
        var password = passwordInput.text
        var contact = contactInput.text
        var address = addressInput.text
        var firstName = firstNameInput.text
        var lastName = lastNameInput.text
        var emailFinal = email!
        var passwordFinal = password!
        var count = 0
        var flag = 0
        if(email == "" || password == "" || firstName == "" || lastName == "" || address == "" || contact == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input all the values!"
            alert.addButton(withTitle: "Okay")
            alert.show()
        }else{
            let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
           for i in patients!{
                if i.email!.lowercased() == emailFinal.lowercased() && i.password!.lowercased() == passwordFinal.lowercased(){
                        flag = 1
                        let alert = UIAlertView()
                        alert.title = "Alert: "
                        alert.message = "User already exists!"
                        alert.addButton(withTitle: "Okay")
                        alert.show()
                        emailInput.text = ""
                        firstNameInput.text = ""
                        lastNameInput.text = ""
                        passwordInput.text = ""
                        addressInput.text = ""
                        contactInput.text = ""
                        return 0
                }
            }
            
            if flag == 0{
                patientService.addPatient(firstName: firstName!, lastName: lastName!, address: address!, email: email!, contact: contact!, password: password!, managedContext: managedContext)
                let alert = UIAlertView()
                alert.title = "Alert: "
                alert.message = "Registered Successfully!"
                alert.addButton(withTitle: "Okay")
                alert.show()
                emailInput.text = ""
                firstNameInput.text = ""
                lastNameInput.text = ""
                passwordInput.text = ""
                addressInput.text = ""
                contactInput.text = ""
                return 1
            }
        }
        return 0
    }
}
