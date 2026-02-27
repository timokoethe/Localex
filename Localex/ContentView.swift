//
//  ContentView.swift
//  Localex
//
//  Created by Timo Köthe on 23.02.26.
//

import SwiftUI

/// The root view of the app.
///
/// `ContentView` defines the main tab-based navigation structure of Localex.
/// It provides access to three independent NaturalLanguage showcase modules:
///
/// - **Tokenizer**: Demonstrates word-level tokenization using `NLTokenizer`.
/// - **Recognizer**: Performs language detection using `NLLanguageRecognizer`.
/// - **Embedding**: Generates semantic word vectors using `NLEmbedding`.
///
/// Each tab hosts its own dedicated view and view model, ensuring a clear
/// separation of concerns between the different NLP tasks.
///
/// This view serves as the central navigation container for exploring
/// Apple’s on-device NaturalLanguage capabilities.
struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Tokenizer", systemImage: "text.word.spacing") {
                TokenizerView()
            }
            
            Tab("Recognizer", systemImage: "globe.europe.africa") {
                RecognizerView()
            }
            
            Tab("Embedding", systemImage: "point.3.connected.trianglepath.dotted") {
                EmbeddingView()
            }
        }
    }
}

#Preview {
    ContentView()
}
