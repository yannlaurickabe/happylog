//
//  ContentView.swift
//  happyLog
//
//  Created by Yann-Laurick Abé on 21/10/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
            Text("Hello, HappyLog 👋")
                .padding()
        }
    }

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
