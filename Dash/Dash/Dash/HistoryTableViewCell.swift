//
//  HistoryTableViewCell.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/8/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var carNameLbl: UILabel!
    @IBOutlet weak var pickUpDateLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(carName: String, pickUpDate: String, cost: String){
        carNameLbl.text = carName
        pickUpDateLbl.text = pickUpDate
        costLbl.text = cost
    }

}
