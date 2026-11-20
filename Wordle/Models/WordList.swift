//
//  WordList.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 20/11/26.
//

enum WordList {
    static let words = [ "APPLE", "BRAVE", "CRANE", "DRINK", "EARTH", "FLAME", "GHOST", "HOUSE", "LIGHT", "MONEY", "NIGHT", "PLANT", "SMILE", "TRUMP"]
    
    static func random() -> String { words.randomElement()! }
    static func isValid(_ word: String) -> Bool { words.contains(word) }
}
