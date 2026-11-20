//
//  TileView.swift
//  Wordle
//
//  Created by Ahmad Abdullah on 20/11/26.
//

import SwiftUI

struct TileView: View {
    let letter: Character?
    let state: LetterState
    
    var body: some View {
        Text(letter.map(String.init) ?? "")
            .font(.title.bold())
            .frame(width: 56, height: 56)
            .background(state.color, in: .rect(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.secondary.opacity(0.4), lineWidth: state == .unknown ? 2 : 0)
            }
            .foregroundStyle(state == .unknown ? Color.primary : .white)
    }
}

#Preview {
    HStack {
        TileView(letter: "A", state: .correct)
        TileView(letter: nil, state: .unknown)
    }
}
