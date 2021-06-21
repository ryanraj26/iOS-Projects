//
//  HistoryViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {

    @IBOutlet weak var historyTextView: UITextView!
    
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
        history()
        // Do any additional setup after loading the view.
    }

    func getter(pos: Int){
        self.pos = pos
    }
    
    func history(){
        var result = "You tested on:"
        let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
        var user = patients![pos]
        var hist : [String] = user.testHistory!
        for i in hist{
             result += "\n\(i)"
        }
        historyTextView.text = result
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
