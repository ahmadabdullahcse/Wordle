//
//  GuessGame.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 20/11/26.
//

import Observation

@Observable
final class GuessGame {
    static let wordlength = 5
    static let maxGuess = 6
    
    private(set) var answer = WordList.random()
    private(set) var guess: [String] = []
    private(set) var current = ""
    private(set) var message: String?
    
    var isWon: Bool { guess.last == answer }
    var isOver: Bool { isWon || guess.count == Self.maxGuess }
    
    func type(_ letter: Character) {
        guard !isOver, current.count < Self.wordlength else {
            return
        }
        current.append(letter)
        message = nil
    }
    
    func deleteLetter() {
        if !current.isEmpty { current.removeLast() }
    }
    
    func submit() {
        guard !isOver else { return }
        guard current.count == Self.wordlength else { message = "Not enough letters"; return }
        guard WordList.isValid(current) else { message = "Not in word list"; return }
        guess.append(current)
        current = ""
    }
    
    func newGame() {
        answer = WordList.random()
        guess = []
        current = ""
        message = nil
    }
    
    func states(for guess: String) -> [LetterState] {
        Evaluator.evaluate(guess: guess, answer: answer)
    }
    
    var keyBoardStates: [Character: LetterState] {
        var best: [Character: LetterState] = [:]
        for gues in guess {
            for (ch, state) in zip(gues, states(for: gues)) {
                best[ch] = max(best[ch] ?? .unknown, state)
            }
        }
        return best
    }
}
