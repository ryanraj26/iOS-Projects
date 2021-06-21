//
//  ProfileEditViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var contactInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var updateBtn: UIButton!
    
    
    var pos = 0
    var managedContext : NSManagedObjectContext!
    let patientService = PatientCoreData()
    let patient = Patient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }

    func getter(pos: Int){
        self.pos = pos
    }

    
    @IBAction func updateClicked(_ sender: Any) {
        update()
    }
    
    func update(){
        let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
        
        var user = patients![pos]
        //var user = PatientData.patients[pos]
        if firstNameInput.text == "" && lastNameInput.text == "" && addressInput.text == "" && contactInput.text == "" && emailInput.text == "" && passwordInput.text == ""{
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input the values!"
            alert.addButton(withTitle: "Okay")
            alert.show()
        }else{
            if firstNameInput.text != ""{
                user.firstName = firstNameInput.text!
            }
            if lastNameInput.text != ""{
                user.lastName = lastNameInput.text!
            }
            if addressInput.text != ""{
                user.address = addressInput.text!
            }
            if contactInput.text != ""{
                user.contact = contactInput.text!
            }
            if emailInput.text != ""{
                user.email = emailInput.text!
            }
            if passwordInput.text != ""{
                user.password = passwordInput.text!
            }
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "Updated Successfully!"
            alert.addButton(withTitle: "Okay")
            alert.show()
            emailInput.text = ""
            firstNameInput.text = ""
            lastNameInput.text = ""
            passwordInput.text = ""
            addressInput.text = ""
            contactInput.text = ""
        }
        
    }
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
