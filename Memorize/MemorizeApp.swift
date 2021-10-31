//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vinícius Moreira on 24/07/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
