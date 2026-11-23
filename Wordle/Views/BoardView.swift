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
                    ForEach(0..<GuessGame.wordLength, id: \.self) { col in
                        let letters = Array(word)
                        TileView(letter: col < letters.count ? letters[col] : nil, state: states[col])
                    }
                }
            }
        }
    }
    
    private func content(for row: Int) -> (String, [LetterState]) {
        let blank = Array(repeating: LetterState.unknown, count: GuessGame.wordLength)
        if row < game.guesses.count {
            let guess = game.guesses[row]
            return (guess, game.states(for: guess))
        }
        return (row == game.guesses.count ? game.current : "", blank)
    }
}
