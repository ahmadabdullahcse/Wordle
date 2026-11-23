//
//  Evaluator.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 18/11/26.
//

enum Evaluator {
    static func evaluate(guess: String, answer: String) -> [LetterState] {
        let g = Array(guess), a = Array(answer)
        var result = Array(repeating: LetterState.absent, count: g.count)
        var leftovers: [Character: Int] = [:]
        
        for i in g.indices {
            if g[i] == a[i] { result[i] = .correct }
            else { leftovers[a[i], default: 0] += 1 }
        }
        
        for i in g.indices where result[i] != .correct {
            if let n = leftovers[g[i]], n>0 {
                result[i] = .present
                leftovers[g[i]] = n - 1
            }
        }
        return result
    }
}
