//
//  ShoppingListTableViewController.swift
//  Eva
//
//  Created by LMNTrix on 4/27/21.
//

import UIKit

class ShoppingListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var shoppingListTable: UITableView!
    @IBOutlet weak var addBtnClicked: UIButton!
    
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(apartment.shoppingList.count)
        var tabbar = tabBarController as! HomeTabBarViewController
        self.apartment = tabbar.apartment
        self.roomie = tabbar.roomie
        shoppingListTable.dataSource = self
        shoppingListTable.separatorStyle = .none
        shoppingListTable.rowHeight = 75
        shoppingListTable.reloadData()
        //self.shoppingListTable.register(ShoppingListTableViewCell.self, forCellReuseIdentifier: "grocery")
//        self.shoppingListTable.register(UINib(nibName: "ShoppingListTableViewCell", bundle: nil), forCellReuseIdentifier: "grocery")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return apartment.shoppingList.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ShoppingListTableViewCell
        
//        cell.commonInit(name: apartment.shoppingList[indexPath.row].product, quantity: apartment.shoppingList[indexPath.row].quantity, num: String(indexPath.row))
        
        cell.itemNameLbl?.text = apartment.shoppingList[indexPath.row].product
        cell.itemNumberLbl?.text = "\(indexPath.row + 1)."
        cell.quantityLbl?.text = apartment.shoppingList[indexPath.row].quantity
        // Configure the cell...

        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.shoppingListTable.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            apartment.shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            do {
                sleep(1)
            }
            shoppingListTable.reloadData()
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destinationVC = segue.destination as! AddItemViewController
        destinationVC.apartment = apartment
        destinationVC.roomie = roomie
        // Pass the selected object to the new view controller.
    }

    @IBAction func addBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "addItem", sender: nil)
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        shoppingListTable.reloadData()
    }
}
