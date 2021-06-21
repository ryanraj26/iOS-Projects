//
//  SupplierTableViewCell.swift
//  Assignment 7
//
//  Created by LMNTrix on 3/19/21.
//

import UIKit

class SupplierTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(name: String, email: String, quantity: Int64){
        lblName.text = name
        
        lblEmail.text = email
        
        lblQuantity.text = String(quantity)
    }
    
}
