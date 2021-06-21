//
//  StatusViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/21/21.
//

import UIKit
import CoreData

class StatusViewController: UIViewController {

    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var refreshBtn: UIButton!
    var pos = 0
    var managedContext : NSManagedObjectContext!
    let scheduler = Scheduler()
    let schedulerService = SchedulerCoreData()
    let patientService = PatientCoreData()
    let patient = Patient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        
        let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
        
        if(patients![pos].testHistory!.count > 0){
            patients![pos].status = "C"
            statusLbl.textColor = UIColor.green
        }else{
            patients![pos].status = "NC"
            statusLbl.textColor = UIColor.red
        }
        statusLbl.text = patients![pos].status
        // Do any additional setup after loading the view.
    }

    
    func getter(pos: Int){
        self.pos = pos
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
        if(patients![pos].testHistory!.count > 0){
            patients![pos].status = "C"
            statusLbl.textColor = UIColor.green
        }else{
            patients![pos].status = "NC"
            statusLbl.textColor = UIColor.red
        }
        statusLbl.text = patients![pos].status
    }
    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
