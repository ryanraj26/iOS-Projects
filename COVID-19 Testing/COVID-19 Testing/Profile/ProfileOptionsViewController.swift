//
//  ProfileOptionsViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class ProfileOptionsViewController: UIViewController {
    
    @IBOutlet weak var editProfileBtn: UIButton!
    @IBOutlet weak var viewProfileBtn: UIButton!
    
    @IBOutlet weak var deleteProfileBtn: UIButton!
    
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
    
    @IBAction func editProfileClicked(_ sender: Any) {
        ProfileEditViewController().getter(pos: pos)
        let profileEdit = ProfileEditViewController(nibName: "ProfileEditViewController", bundle: nil)
        self.present(profileEdit, animated: true, completion: nil)
    }
    
   
    @IBAction func viewProfileClicked(_ sender: Any) {
        ViewProfileViewController().getter(pos: pos)
        let viewProfile = ViewProfileViewController(nibName: "ViewProfileViewController", bundle: nil)
        self.present(viewProfile, animated: true, completion: nil)
    }
    
    
    @IBAction func deleteProfileClicked(_ sender: Any) {
        deleteProfile()
    }
    
    func deleteProfile(){
        let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
        let alertController = UIAlertController(title: "Warning", message: "Are you sure you want to delete you profile?", preferredStyle: .alert)
               
               // Create OK button
               let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                
                self.managedContext.delete(patients![self.pos])
                
                let login = PatientLoginViewController(nibName: "PatientLoginViewController", bundle: nil)
                self.present(login, animated: true, completion: nil)
                   
               }
               alertController.addAction(OKAction)
               
               // Create Cancel button
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
                   
               }
               alertController.addAction(cancelAction)
               
               // Present Dialog message
               self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
