//
//  ScheduleTestViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/20/21.
//

import UIKit
import CoreData

class ScheduleTestViewController: UIViewController {
    @IBOutlet weak var slotsTextView: UITextView!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var bookBtn: UIButton!
    
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
        
        slotsTextView.text = ""
        

        display()
        
        // Do any additional setup after loading the view.
    }
    
    func getter(pos: Int){
        self.pos = pos
        
    }

    @IBAction func bookClicked(_ sender: Any) {
        book()
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        
    }
    
    
    func display(){
        
        slotsTextView.text = ""
        var result = ""
        var count = 0
        let schedules = schedulerService.getSchedules(managedContext: managedContext).fetchedObjects
        for i in schedules! {
            count += 1
            result += "\n\(count). \nDate: \(i.date!) "
            for j in i.schedule! {
                result += "\n\(j)"
            }
            result += "\n___________________________\n"
        }
        slotsTextView.text = result
        
    }
    
    func book(){
        var date = dateInput.text!
        var time = timeInput.text!
        let schedules = schedulerService.getSchedules(managedContext: managedContext).fetchedObjects
        for i in schedules! {
            if i.date == date{
                var pos = 0
                var currpos = 0
                for j in i.schedule! {
                    if j == time{
                        pos = currpos
                    }else{
                        currpos += 1
                    }
                }
                i.schedule!.remove(at: pos)
                let patients = patientService.getPatients(managedContext: managedContext).fetchedObjects
                //var user = patients![pos]
                var str = "\(date) at \(time)"
                patients![pos].testHistory?.append(str)
                let alert = UIAlertView()
                alert.title = "Alert: "
                alert.message = "Appointment booked for \(date) at \(time)"
                alert.addButton(withTitle: "Okay")
                alert.show()
                dateInput.text = ""
                timeInput.text = ""
                display()
            }
        }
    }
    
    
    func refresh(){
        slotsTextView.text = ""
        display()
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
