//
//  ViewSupplierViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit
import CoreData

class ViewSupplierViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let suppliers = supplierService.getSuppliers(managedContext: managedContext).fetchedObjects
        return suppliers!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSuppliers.dequeueReusableCell(withIdentifier: "SupplierTableViewCell", for: indexPath) as! SupplierTableViewCell
        let suppliers = supplierService.getSuppliers(managedContext: managedContext).fetchedObjects
        for item in suppliers!{
            cell.initCell(name: item.name!, email: item.email!, quantity: item.quantity)
        }
        return cell
    }
    
    @IBOutlet weak var tblSuppliers: UITableView!
    
    var managedContext : NSManagedObjectContext!
    let supplierService = SupplierCoreData()
    let supplier = Supplier()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initDisplay()
        tblSuppliers.dataSource = self
        tblSuppliers.delegate = self
        
        let nibName = UINib(nibName: "SupplierTableViewCell", bundle: nil)
        tblSuppliers.register(nibName, forCellReuseIdentifier: "SupplierTableViewCell")
        
        let app = UIApplication.shared.delegate as! AppDelegate
        managedContext = app.persistentContainer.viewContext
    }

    func initDisplay(){
        var result = ""
        
        let suppliers = supplierService.getSuppliers(managedContext: managedContext).fetchedObjects
        
        
        
        for pos in 0...suppliers!.count-1{

            
            result += "1.\nName: \(suppliers![pos].name)  \nAddress: \(suppliers![pos].address) \nContact Number: \(suppliers![pos].phone) \nEmail ID: \(suppliers![pos].email) \nQuantity: \(suppliers![pos].quantity) \n"
        }
    }

    
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
