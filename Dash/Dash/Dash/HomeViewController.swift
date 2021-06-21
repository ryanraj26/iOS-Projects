//
//  HomeViewController.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/6/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var user = UserModel(firstName: "", lastName: "", address: "", contact: "", email: "", password: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        CarData.tempArr.removeAll()
        // Do any additional setup after loading the view.
    }
    

    func currentUser(user: UserModel){
        self.user = user
    }

}
