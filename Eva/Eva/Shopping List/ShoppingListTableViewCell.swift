//
//  ShoppingListTableViewCell.swift
//  Eva
//
//  Created by LMNTrix on 4/27/21.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    
    
    
    
    
    @IBOutlet weak var itemNumberLbl: UILabel?
    @IBOutlet weak var itemNameLbl: UILabel?
    @IBOutlet weak var quantityLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func commonInit(name : String, quantity : String, num: String){
        itemNameLbl!.text = name
        quantityLbl.text = quantity
        itemNumberLbl!.text = String(Int(num)!+1)
    }
    
}
