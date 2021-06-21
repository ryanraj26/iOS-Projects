//
//  DeleteSupplierViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit
import CoreData

class DeleteSupplierViewController: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var managedContext : NSManagedObjectContext!
    let supplierService = SupplierCoreData()
    let supplier = Supplier()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }

    
    func deleteSupplier(){
        var name = nameInput.text
        var email = emailInput.text
        var pos = 0
        var currpos = 0
        var flag = 0
        let suppliers = supplierService.getSuppliers(managedContext: managedContext).fetchedObjects
        if(name == "" || email == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input all the values!"
            alert.addButton(withTitle: "Okay")
            alert.show()
        }else{
            
            
            for i in suppliers!{
                if i.name == name && i.email == email{
                    pos = currpos
                    flag = 1
                }else{
                    currpos += 1
                }
            }
           
        }
        if flag == 1{
            managedContext.delete(suppliers![pos])
            //SupplierData.suppliers.remove(at: pos)
            let alert = UIAlertView()
            alert.title = "Success: "
            alert.message = "\(name!) is deleted in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
        }else{
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "\(name!) is not a supplier in the system!"
            alert.addButton(withTitle: "Got it!")
            alert.show()
        }
        nameInput.text = ""
        emailInput.text = ""
        nameInput.resignFirstResponder()
        emailInput.resignFirstResponder()
    }
    
    
    @IBAction func deleteBtnClicked(_ sender: Any) {
        deleteSupplier()
    }
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
