//
//  Words.swift
//  DictionaryTemplate
//
//  Created by Cuneyt on 22.09.2023.
//

import Foundation

class Words:Codable{
    var kelime_id:String?
    var ingilizce:String?
    var turkce:String?
    
    init(kelime_id: String? = nil, ingilizce: String? = nil, turkce: String? = nil) {
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
}
