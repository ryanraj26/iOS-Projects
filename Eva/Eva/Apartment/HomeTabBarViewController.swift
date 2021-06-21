//
//  HomeTabBarViewController.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/26/21.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    
    @IBOutlet weak var apartmentLbl: UILabel!
    @IBOutlet weak var roomieLbl: UILabel!
    
    
    //var homeVC: ApartmentHomeViewController! //First child
    
    var apartment = ApartmentModel(name: "H", number: "")
    var roomie = UserModel(firstName: "", lastName: "", contact: "", email: "", password: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var vc = self.tabBarController!.viewControllers![0] as! ApartmentHomeViewController
//        vc.apartment = apartment
//        vc.roomie = roomie
//        apartmentLbl.text = "\(apartment.name), \(apartment.number)"
//        roomieLbl.text = roomie.firstName
        //homeVC = self.viewControllers![0] as! ApartmentHomeViewController
        // Do any additional setup after loading the view.
    }
    
    

    
    // MARK: - Navigation

//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        homeVC.apartment = apartment
//        homeVC.roomie = roomie
//    }
//
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        var vc = self.tabBarController!.viewControllers![0] as! ApartmentHomeViewController
//        vc.apartment = apartment
//        vc.roomie = roomie
//        // Pass the selected object to the new view controller.
//    }
    

}
