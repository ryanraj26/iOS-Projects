//
//  TableCellBookCarTableViewCell.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/8/21.
//

import UIKit

class TableCellBookCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imageViewImg: UIImageView!
    @IBOutlet weak var pickUpLbl: UILabel!
    @IBOutlet weak var dropOffLbl: UILabel!
    
    func commoninit(name: String, hrs: Int, dropOff: String, row: Int){
        //var formatter = DateFormatter()
        //var hrs = formatter.date(from: pickUp)?.timeIntervalSince(formatter.date(from: dropOff)!)
        var cost = ""
        for item in CarData.cars {
            if item.name == CarData.tempArr[myIndex]{
                cost = "$\(String(Double(CarData.hrs) * item.cost))"
                //costLbl.text = cost
            }
        }
        nameLbl.text = name
        pickUpLbl.text = String(hrs)
        dropOffLbl.text = cost
        //imageViewImg.image = UIImage(named: CarData.tempArr[row] + ".jpg")
    }

}
