//
//  ManageSupplierViewController.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit

class ManageSupplierViewController: UIViewController {

    @IBOutlet weak var btnAddSupplier: UIButton!
    
    @IBOutlet weak var btnUpdateSupplier: UIButton!
    
    @IBOutlet weak var btnDeleteSupplier: UIButton!
    
    @IBOutlet weak var btnViewSupplier: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addSupplierClicked(_ sender: Any) {
        let addSupplier = AddSupplier(nibName: "AddSupplierView", bundle: nil)
        self.present(addSupplier, animated: true, completion: nil)
    }
    
    @IBAction func updateSupplierClicked(_ sender: Any) {
        let updateSupplier = UpdateSupplierViewController(nibName: "UpdateSupplierViewController", bundle: nil)
        self.present(updateSupplier, animated: true, completion: nil)
    }
    
    @IBAction func deleteSupplierClicked(_ sender: Any) {
        let deleteSupplier = DeleteSupplierViewController(nibName: "DeleteSupplierViewController", bundle: nil)
        self.present(deleteSupplier, animated: true, completion: nil)
    }
    
    @IBAction func viewSupplierClicked(_ sender: Any) {
        let viewSupplier = ViewSupplierViewController(nibName: "ViewSupplierViewController", bundle: nil)
        self.present(viewSupplier, animated: true, completion: nil)
    }
}
