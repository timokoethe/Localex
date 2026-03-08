//
//  EmbeddingViewModel.swift
//  Localex
//
//  Created by Timo Köthe on 26.02.26.
//

import Observation
import NaturalLanguage

@Observable
class EmbeddingViewModel {
    var hasEmbedding: Bool
    var inputText: String   // The text currently entered by the user.
    var vector: [Double]
    var word: String
    
    /// Initializes all variables with their values.
    init() {
        self.hasEmbedding = false
        self.inputText = ""
        self.vector = []
        self.word = ""
    }
    
    /// Generates a word embedding vector for the first word in the current input.
    ///
    /// This function performs the full embedding retrieval cycle:
    /// - Extracts the first word from `inputText` (split by whitespace)
    /// - Loads the system’s English word embedding model using `NLEmbedding.wordEmbedding(for:)`
    /// - Requests the high-dimensional vector representation via `vector(for:)`
    /// - Stores the resulting `[Double]` in `vector` if available
    /// - Updates the state to indicate whether a valid embedding was generated
    ///
    /// If no embedding model is available or the word is not part of the model’s
    /// vocabulary, no vector is stored and `hasEmbedding` remains `false`.
    func getWordEmbedding() {
        let firstWord = inputText.split(separator: " ").first ?? ""
        
        if let wordEmbedding = NLEmbedding.wordEmbedding(for: .english) {
            if let wordVector = wordEmbedding.vector(for: String(firstWord)) {
                self.vector = wordVector
                self.word = String(firstWord)
            }
        }
        
        hasEmbedding = !vector.isEmpty
    }
    
    /// Resets the current session to initial values.
    ///
    /// This function resets the current view by setting all variables to their initial values.
    func reset() {
        inputText.removeAll()
        vector.removeAll()
        word.removeAll()
        hasEmbedding = false
    }
}
