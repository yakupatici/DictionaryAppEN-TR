//
//  Kelimeler.swift
//  SozlukUygulamasii
//
//  Created by Jacob on 29.08.2023.
//

import Foundation
class Kelimeler {
    
    
    var kelime_id : Int?
    var ingilizce:String?
    var turkce : String?
    
    
    init(kelime_id: Int? = nil, ingilizce: String? = nil, turkce: String? = nil) {
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
}
