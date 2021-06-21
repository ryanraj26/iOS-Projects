//
//  ViewProfileViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class ViewProfileViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addresTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var updateBtn: UIButton!
    
    
    var pos = 0
    var managedContext : NSManagedObjectContext!
    let patientService = PatientCoreData()
    let patient = Patient()
    
    
    func getter(pos: Int){
        self.pos = pos
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
        firstNameTextField.text = patients![pos].firstName
        lastNameTextField.text = patients![pos].lastName
        addresTextField.text = patients![pos].address
        contactTextField.text = patients![pos].contact
        emailTextField.text = patients![pos].email
        passwordTextField.text = patients![pos].password
        ProfileEditViewController().getter(pos: pos)
        // Do any additional setup after loading the view.
    }

    @IBAction func updateClicked(_ sender: Any) {
        let updateProfile = ProfileEditViewController(nibName: "ProfileEditViewController", bundle: nil)
        self.present(updateProfile, animated: true, completion: nil)
    }
    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
