//
//  ManageAvailableCarsTableViewController.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/8/21.
//

import UIKit


 var myIndex = 0
 var index1 = 0

extension UIImageView {
    func load(url: String) {
        let urlBuilder1 = URLComponents(string: url)

        let url1 = urlBuilder1?.url
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url1!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class ManageAvailableCarsTableViewController: UITableViewController{

    
    
    @IBOutlet var tblCars: UITableView!
    
    
    var user = UserModel(firstName: "", lastName: "", address: "", contact: "", email: "", password: "")
    var arr = ["LMN", "TRIX"]
    var cars = [String]()
    var pickUp = ""
    var dropOff = ""
    var carPos = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TableCellBookCarTableViewCell().imageView?.load(url: CarData.cars[myIndex].imageURL)
//        exampleLbl.text = String(cars.count)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func currentUser(user: UserModel){
        self.user = user
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.tblCars.reloadData()
//    }
    
    func getCars(car: String){
        cars.append(car)
    }
    
    func getCarsPos(carPos: [Int]){
        self.carPos = carPos
    }
    
    func getTime(pickUp: String, dropOff: String){
        self.pickUp = pickUp
        self.dropOff = dropOff
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CarData.tempArr.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tblCars.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! TableCellBookCarTableViewCell
//
////        for item in carPos {
////            cell.commoninit(name: CarData.cars[item].name, pickUp: pickUp, dropOff: dropOff)
////        }
//
//        cell.commoninit(name: CarData.cars[0].name, pickUp: "pickUp", dropOff: "dropOff")
//
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "carDetails", sender: self)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! TableCellBookCarTableViewCell

        //cell.commoninit(name: "LMN", pickUp: "P", dropOff: "D")
//        cell.nameLbl.text = CarData.tempArr[indexPath.row]
//        cell.pickUpLbl.text = CarData.tempPickup
//        cell.dropOffLbl.text = CarData.tempDropOff
        
        cell.commoninit(name: CarData.tempArr[indexPath.row], hrs: CarData.hrs, dropOff: CarData.tempDropOff, row: indexPath.row)
        cell.imageView?.image = UIImage(named: CarData.tempArr[indexPath.row] + ".jpg")
        var pos = 0
        for item in CarData.cars {
            if item.name == CarData.tempArr[indexPath.row] {
                //cell.imageView?.image = UIImage(named: CarData.tempArr[indexPath.row] + ".jpg")
                index1 = pos
            }else{
                pos += 1
            }
        }
        cell.imageView?.load(url: CarData.cars[indexPath.row].imageURL)
        
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
