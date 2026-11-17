//
//  LetterState.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 18/11/26.
//

import SwiftUI

enum LetterState: Int, Comparable {
    case unknown = 0
    case absent = 1
    case present = 2
    case correct = 3
    
    static func < (a: Self, b: Self) -> Bool { a.rawValue < b.rawValue }
    
    var color: Color {
        switch self {
        case .unknown: .clear
        case .absent: .gray
        case .present: .yellow
        case .correct: .green
        }
    }
}
