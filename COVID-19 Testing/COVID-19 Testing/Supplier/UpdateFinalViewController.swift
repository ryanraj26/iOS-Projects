//
//  UpdateFinalViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit
import CoreData

class UpdateFinalViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var contactInput: UITextField!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var quantityInput: UITextField!
    @IBOutlet weak var updateBtn: UIButton!
    
    var pos = 0
    var managedContext : NSManagedObjectContext!
    let supplierService = SupplierCoreData()
    let supplier = Supplier()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }

    func setterGetter(pos: Int){
        self.pos = pos
    }
    

    func update(){
        var name = nameInput.text
        var address = addressInput.text
        var contact = contactInput.text
        var email = emailInput.text
        var quantity = quantityInput.text
        
        let suppliers = supplierService.getSuppliers(managedContext: managedContext).fetchedObjects
        
        var sup = suppliers![pos]
        
        
        
        if(name == "" && address == "" && contact == "" && email == "" && quantity == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You forgot to input updated values!"
            alert.addButton(withTitle: "Okay")
            alert.show()
        }
        
        if name != ""{
            sup.name = name!
        }
        
        if address != ""{
            sup.address = address!
        }
        
        if contact != ""{
            sup.phone = contact!
        }
        
        if email != ""{
            sup.email = email!
        }
        
        if quantity != ""{
            sup.quantity = Int64(quantity!)!
        }
        let alert = UIAlertView()
        alert.title = "Alert: "
        alert.message = "Supplier Details Updated!"
        alert.addButton(withTitle: "Okay")
        alert.show()
        
        nameInput.text = ""
        addressInput.text = ""
        contactInput.text = ""
        emailInput.text = ""
        quantityInput.text = ""
    }

    @IBAction func updateClicked(_ sender: Any) {
        update()
    }
    
    
    @IBAction func closeClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
