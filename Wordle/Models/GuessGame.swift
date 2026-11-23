//
//  GuessGame.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 20/11/26.
//

import Observation

@Observable
final class GuessGame {
    static let wordLength = 5
    static let maxGuess = 6
    
    private(set) var answer = WordList.random()
    private(set) var guesses: [String] = []
    private(set) var current = ""
    private(set) var message: String?
    
    var isWon: Bool { guesses.last == answer }
    var isOver: Bool { isWon || guesses.count == Self.maxGuess }
    
    func type(_ letter: Character) {
        guard !isOver, current.count < Self.wordLength else {
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
        guard current.count == Self.wordLength else { message = "Not enough letters"; return }
        guard WordList.isValid(current) else { message = "Not in word list"; return }
        guesses.append(current)
        current = ""
    }
    
    func newGame() {
        answer = WordList.random()
        guesses = []
        current = ""
        message = nil
    }
    
    func states(for guess: String) -> [LetterState] {
        Evaluator.evaluate(guess: guess, answer: answer)
    }
    
    var keyboardStates: [Character: LetterState] {
        var best: [Character: LetterState] = [:]
        for guess in guesses {
            for (ch, state) in zip(guess, states(for: guess)) {
                best[ch] = max(best[ch] ?? .unknown, state)
            }
        }
        return best
    }
}
