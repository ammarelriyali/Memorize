//
//  MemorizeApp.swift
//  Memorize
//
//  Created by ammar on 10/05/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var gvm=GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(gvm:gvm)
                
        }
    }
}
