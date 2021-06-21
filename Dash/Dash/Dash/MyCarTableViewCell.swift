//
//  MyCarTableViewCell.swift
//  Assignment 9
//
//  Created by LMNTrix on 4/8/21.
//

import UIKit

class MyCarTableViewCell: UITableViewCell {
    @IBOutlet weak var carNameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func commonInit(name: String, location: String, cost: String){
        carNameLbl.text = name
        locationLbl.text = location
        costLbl.text = "$\(cost)"
    }
    
}
