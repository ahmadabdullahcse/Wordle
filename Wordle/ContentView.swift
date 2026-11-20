//
//  ContentView.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 17/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var game = GuessGame()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Wordle").font(.largeTitle.bold())
            Text(game.message ?? " ").foregroundStyle(.secondary)
            BoardView(game: game)
            Spacer()
            if game.isOver {
                Text(game.isWon ? "You got it!" : "The word was \(game.answer)")
                    .font(.title2)
                Button("New Game") { game.newGame() }
                    .buttonStyle(.borderedProminent)
            } else {
                KeyboardView(game: game)
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
