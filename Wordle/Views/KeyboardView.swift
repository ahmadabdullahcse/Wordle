//
//  KeyboardView.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 21/11/26.
//

import SwiftUI

struct KeyboardView: View {
    let game: GuessGame
    private let rows = ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
    
    var body: some View {
        let states = game.keyboardStates
        VStack(spacing: 8) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 5) {
                    if row == rows.last {
                        Button("Enter") { game.submit() }.buttonStyle(.bordered)
                    }
                    ForEach(Array(row), id: \.self) { ch in
                        let state = states[ch] ?? .unknown
                        Button { game.type(ch) } label: {
                            Text(String(ch))
                                .font(.headline)
                                .frame(width: 32, height: 48)
                                .background(state == .unknown ? Color.secondary.opacity(0.2) : state.color,
                            in: .rect(cornerRadius: 8))
                                .foregroundStyle(state == .unknown ? Color.primary : .white)
                        }
                    }
                    if row == rows.last {
                        Button { game.deleteLetter() } label: {
                            Image(systemName: "delete.left")
                        }.buttonStyle(.bordered)
                    }
                }
            }
        }
    }
}
