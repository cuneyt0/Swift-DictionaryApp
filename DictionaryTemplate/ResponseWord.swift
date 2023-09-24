//
//  ResponseWord.swift
//  DictionaryTemplate
//
//  Created by Cuneyt on 24.09.2023.
//

import Foundation

class ResponseWord:Codable{
    
    var kelimeler:[Words]?
    
    init(kelimeler: [Words]? = nil) {
        self.kelimeler = kelimeler
    }
}
