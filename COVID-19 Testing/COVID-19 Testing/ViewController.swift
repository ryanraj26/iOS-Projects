//
//  ViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var btnSupplier: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func supplierClicked(_ sender: Any) {
        
        let manageSupplierView = ManageSupplierViewController(nibName: "ManageSupplierViewController", bundle: nil)
        self.present(manageSupplierView, animated: true, completion: nil)
    }
    
    @IBAction func patientClicked(_ sender: Any) {
        let patientOptions = PatientOptionsViewController(nibName: "PatientOptionsViewController", bundle: nil)
        self.present(patientOptions, animated: true, completion: nil)
    }
}

