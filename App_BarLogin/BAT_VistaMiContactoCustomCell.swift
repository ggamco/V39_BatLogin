//
//  BAT_VistaMiContactoCustomCell.swift
//  App_BarLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BAT_VistaMiContactoCustomCell: UITableViewCell {

    
    //MARK: - IBOutlets
    @IBOutlet weak var myFotoContacto: UIImageView!
    @IBOutlet weak var myNombreLB: UILabel!
    @IBOutlet weak var myApellidoLB: UILabel!
    
    
    //MARK: - LIFE VC
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
}
