//
//  AddSupplier.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit
import CoreData

class AddSupplier: UIViewController, UITextFieldDelegate {
    //@IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var addressInput: UITextField!
    
    @IBOutlet weak var contactTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var quantityTxtField: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    var managedContext : NSManagedObjectContext!
    let supplierService = SupplierCoreData()
    let supplier = Supplier()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInput.delegate = self
        addressInput.delegate = self
        contactTxtField.delegate = self
        emailTxtField.delegate = self
        quantityTxtField.delegate = self
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
    }

    @IBAction func addSupplierClicked(_ sender: Any) {
        addSupplier()
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func addSupplier(){
        let name = nameInput.text
        let address = addressInput.text
        let contact = contactTxtField.text
        let email = emailTxtField.text
        let quantity = quantityTxtField.text
        let id = UUID().uuidString
        
        if(name == "" || address == "" || contact == "" || email == "" || quantity == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to enter all the values!"
            alert.addButton(withTitle: "Okay")
            alert.show()
            nameInput.text = ""
            addressInput.text = ""
            contactTxtField.text = ""
            emailTxtField.text = ""
            quantityTxtField.text = ""
            
        }else{
            var count = 0
            
            let suppliers = supplierService.getSuppliers(managedContext: managedContext).fetchedObjects
            
            for object in suppliers!{
                if(object.name == name && object.email == email){
                    let alert = UIAlertView()
                    alert.title = "Error"
                    alert.message = "Supplier Exists!"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    break
                }else{
                    count += 1
                }
            }
            /*for i in SupplierData.suppliers {
                if(i.name == name && i.email == email){
                    let alert = UIAlertView()
                    alert.title = "Error"
                    alert.message = "Supplier Exists!"
                    alert.addButton(withTitle: "OK")
                    alert.show()
                    break
                }else{
                    count += 1
                }
            }*/
            if count == suppliers!.count{
                /*let supplier = SupplierModel(name: name!, address: address!, phone: contact!, email: email!, quantity: Int(quantity!)!)
                SupplierData.suppliers.append(supplier)*/
                
                supplierService.addSupplier(name: name!, address: address!, email: email!, phone: contact!, quantity: Int(quantity!)!, managedContext: managedContext)
                
                let alert = UIAlertView()
                alert.title = "Success: "
                alert.message = "Supplier Name: \(name!) is added in the system!"
                alert.addButton(withTitle: "Got it!")
                alert.show()
            }
            nameInput.text = ""
            addressInput.text = ""
            contactTxtField.text = ""
            emailTxtField.text = ""
            quantityTxtField.text = ""
        }
    }
    
    

}
