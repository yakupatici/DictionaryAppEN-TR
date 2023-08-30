//
//  KelimeDetayViewController.swift
//  SozlukUygulamasii
//
//  Created by Jacob on 29.08.2023.
//

import UIKit

class KelimeDetayViewController: UIViewController {
    
    
    @IBOutlet weak var ingilizceLabel: UILabel!
    
    @IBOutlet weak var turkceLabel: UILabel!
    
    var kelime : Kelimeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k = kelime {
            ingilizceLabel.text = k.ingilizce
            turkceLabel.text = k.turkce
            
        }

    }
    

 

}
