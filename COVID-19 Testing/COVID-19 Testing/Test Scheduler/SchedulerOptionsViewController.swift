//
//  SchedulerOptionsViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class SchedulerOptionsViewController: UIViewController {

    @IBOutlet weak var sheduleBtn: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    @IBOutlet weak var statusBtn: UIButton!
    
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
        // Do any additional setup after loading the view.
    }
    
    func getter(pos: Int){
        self.pos = pos
    }

    @IBAction func scheduleClicked(_ sender: Any) {
        ScheduleTestViewController().getter(pos: pos)
        let scheduleTest = ScheduleTestViewController(nibName: "ScheduleTestViewController", bundle: nil)
        self.present(scheduleTest, animated: true, completion: nil)
    }
    
    @IBAction func historyClicked(_ sender: Any) {
        HistoryViewController().getter(pos: pos)
        let history = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
        self.present(history, animated: true, completion: nil)
    }
    
    @IBAction func statusClicked(_ sender: Any) {
        StatusViewController().getter(pos: pos)
        let status = StatusViewController(nibName: "StatusViewController", bundle: nil)
        self.present(status, animated: true, completion: nil)
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
