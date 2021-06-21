//
//  ViewController.swift
//  RoommateHelper
//
//  Created by LMNTrix on 4/25/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleHollowButton(registerBtn)
        Utilities.styleHollowButton(loginBtn)
        // Do any additional setup after loading the view.
    }

    @IBAction func loginClicked(_ sender: Any) {
        print(UserData.users.count)
        print(ApartmentData.apartments.count)
        print(ApartmentData.apartments[0].roommates.count)
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        print(ApartmentData.apartments.count)
    }
}

