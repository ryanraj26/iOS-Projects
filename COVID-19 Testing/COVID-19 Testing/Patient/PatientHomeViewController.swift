//
//  PatientHomeViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class PatientHomeViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var testSchedulerBtn: UIButton!
    var pos = 0
    
    var managedContext : NSManagedObjectContext!
    let patientService = PatientCoreData()
    let patient = Patient()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = ""
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
    func getter(pos: Int){
        self.pos = pos
    }
    
    
    @IBAction func profileBtnClicked(_ sender: Any) {
        ProfileOptionsViewController().getter(pos: pos)
        let profile = ProfileOptionsViewController(nibName: "ProfileOptionsViewController", bundle: nil)
        self.present(profile, animated: true, completion: nil)
    }
    
    @IBAction func testShedulerClicked(_ sender: Any) {
        SchedulerOptionsViewController().getter(pos: pos)
        let testScheduler = SchedulerOptionsViewController(nibName: "SchedulerOptionsViewController", bundle: nil)
        self.present(testScheduler, animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
