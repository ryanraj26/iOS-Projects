//
//  UpdateSupplierViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit
import CoreData

class UpdateSupplierViewController: UIViewController {
    
    var update = UpdateFinalViewController()

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var checkBtn: UIButton!
    
    var managedContext : NSManagedObjectContext!
    let supplierService = SupplierCoreData()
    let supplier = Supplier()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }

    @IBAction func checkBtnClicked(_ sender: Any) {
        
        var flag = checkSuppplier()
        nameTxtField.text = ""
        emailTxtField.text = ""
        if flag == 1{
            let updateSupplier = UpdateFinalViewController(nibName: "UpdateFinalViewController", bundle: nil)
            self.present(updateSupplier, animated: true, completion: nil)
        }
        
    }
    
    func checkSuppplier()->Int{
        let name = nameTxtField.text!
        let email = emailTxtField.text!
        var flag = 0
        var pos = 0
        var currpos = 0
        if(name == "" || email == ""){
            let alert = UIAlertView()
            alert.title = "Alert: "
            alert.message = "You need to input all the values!"
            alert.addButton(withTitle: "Okay")
            alert.show()
        }else{
            
            let suppliers = supplierService.getSuppliers(managedContext: managedContext).fetchedObjects
            
            for object in suppliers! {
                if object.name!.lowercased() == name.lowercased() && object.email!.lowercased() == email.lowercased(){
                    flag = 0
                    pos = currpos
                    break
                }else{
                    flag = 1
                    currpos += 1
                }
            }
            
            /*for i in SupplierData.suppliers{
                if i.name.lowercased() == name.lowercased() && i.email.lowercased() == email.lowercased(){
                    flag = 0
                    pos = currpos
                    break
                }else{
                    flag = 1
                    currpos += 1
                }
            }*/
            if flag == 0{
                update.setterGetter(pos: pos)
                let alert = UIAlertView()
                alert.title = "Alert: "
                alert.message = "Supplier Name: \(name) exists"
                alert.addButton(withTitle: "Okay")
                alert.show()
                return 1
            }else{
                let alert = UIAlertView()
                alert.title = "Alert: "
                alert.message = "Supplier Name: \(name) does not exists!"
                alert.addButton(withTitle: "Okay")
                alert.show()
                return 0
            }
            
        }
        nameTxtField.text = ""
        emailTxtField.text = ""
        return 0
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
