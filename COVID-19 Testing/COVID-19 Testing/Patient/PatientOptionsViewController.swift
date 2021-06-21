//
//  PatientOptionsViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class PatientOptionsViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    var managedContext : NSManagedObjectContext!
    let patientService = PatientCoreData()
    let patient = Patient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }

    @IBAction func registerClicked(_ sender: Any) {
        let registerPatient = PatientRegisterViewController(nibName: "PatientRegisterViewController", bundle: nil)
        self.present(registerPatient, animated: true, completion: nil)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        let loginPatient = PatientLoginViewController(nibName: "PatientLoginViewController", bundle: nil)
        self.present(loginPatient, animated: true, completion: nil)
    }
    

}
