//
//  AddItemViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/28/21.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addItemTextField.delegate = self
        quantityTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addBtnClicked(_ sender: Any) {
        addItem()
        //showAlert(message: "\(addItemTextField.text)")
        addItemTextField.text = ""
        quantityTextField.text = ""
        //performSegue(withIdentifier: "backSegue", sender: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    func addItem(){
        var item = addItemTextField.text
        var quantity = quantityTextField.text
        
        var product = ShoppingListModel(product: item!, quantity: quantity!)
        apartment.shoppingList.append(product)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func showAlert(message: String){
        
        var myAlert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItemTextField.resignFirstResponder()
        quantityTextField.resignFirstResponder()
        
        return true
    }
    
}
