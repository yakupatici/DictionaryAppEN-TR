//
//  KelimeHucreTableViewCell.swift
//  SozlukUygulamasii
//
//  Created by Jacob on 29.08.2023.
//

import UIKit

class KelimeHucreTableViewCell: UITableViewCell {

    @IBOutlet weak var turkishLabel: UILabel!
    
    
    
    @IBOutlet weak var englishhLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
