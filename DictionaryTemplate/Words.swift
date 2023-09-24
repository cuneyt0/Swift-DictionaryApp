//
//  Words.swift
//  DictionaryTemplate
//
//  Created by Cuneyt on 22.09.2023.
//

import Foundation

class Words{
    var kelime_id:Int?
    var inglizce:String?
    var Turkce:String?
    
    init(kelime_id: Int? = nil, inglizce: String? = nil, Turkce: String? = nil) {
        self.kelime_id = kelime_id
        self.inglizce = inglizce
        self.Turkce = Turkce
    }
}
