//
//  PatientLoginViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class PatientLoginViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var managedContext : NSManagedObjectContext!
    let patientService = PatientCoreData()
    let patient = Patient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }


    @IBAction func loginBtnClicked(_ sender: Any) {
        var flag = checkCredentials()
        if flag == 1{
            //let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
            
            let homePage = PatientHomeViewController(nibName: "PatientHomeViewController", bundle: nil)
            self.present(homePage, animated: true, completion: nil)
        }
    }
    
    
    func checkCredentials()->Int{
        var email = emailInput.text
        var password = passwordInput.text
        var emailFinal = email!
        var passwordFinal = password!
        var count = 0
        var flag = 0
        var pos = 0
        var currpos = 0
        if(email == "" || password == ""){
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
                    pos = currpos
                    emailInput.text = ""
                    passwordInput.text = ""
                    let alert = UIAlertView()
                    alert.title = "Alert: "
                    alert.message = "Login Successful!"
                    alert.addButton(withTitle: "Okay")
                    alert.show()
                    //PatientHomeViewController().nameLbl.text = patients![pos].firstName
                    PatientHomeViewController().getter(pos: pos)
                    return 1
                }else{
                    currpos += 1
                }
            }
        
                if flag == 0{
                    let alert = UIAlertView()
                    alert.title = "Alert: "
                    alert.message = "Enter valid credentials!"
                    alert.addButton(withTitle: "Okay")
                    alert.show()
                    emailInput.text = ""
                    passwordInput.text = ""
                }
            return 0
        }
        return 0
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
