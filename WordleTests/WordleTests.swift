//
//  WordleTests.swift
//  WordleTests
//
//  Created by Ahmad Abdullah on 17/11/26.
//

import Testing
@testable import Wordle

struct EvaluatorTests {
    @Test func allCorrect() {
        #expect(Evaluator.evaluate(guess: "CRANE", answer: "CRANE") == Array(repeating: .correct, count: 5))
    }
    
    @Test func repeatedLetters() {
        #expect(Evaluator.evaluate(guess: "LEVEL", answer: "HELLO") == [.present, .correct, .absent, .absent, .present])
    }
}
