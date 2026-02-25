//
//  ContentView.swift
//  Localex
//
//  Created by Timo Köthe on 23.02.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Tokenizer", systemImage: "text.word.spacing") {
                TokenizerView()
            }
            
            Tab("Recognizer", systemImage: "globe.europe.africa") {
                RecognizerView()
            }
        }
    }
}

#Preview {
    ContentView()
}
