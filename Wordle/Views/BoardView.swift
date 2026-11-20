//
//  BoardView.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 21/11/26.
//

import SwiftUI

struct BoardView: View {
    let game: GuessGame
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<GuessGame.maxGuess, id: \.self) { row in
                let (word, states) = content(for: row)
                HStack(spacing: 8) {
                    ForEach(0..<GuessGame.wordlength, id: \.self) { col in
                        let letters = Array(word)
                        TileView(letter: col < letters.count ? letters[col] : nil, state: states[col])
                    }
                }
            }
        }
    }
    
    private func content(for row: Int) -> (String, [LetterState]) {
        let blank = Array(repeating: LetterState.unknown, count: GuessGame.wordlength)
        if row < game.guess.count {
            let guess = game.guess[row]
            return (guess, game.states(for: guess))
        }
        return (row == game.guess.count ? game.current : "", blank)
    }
}
