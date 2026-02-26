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
    
    /// Initializes all variables with their values.
    init() {
        self.hasEmbedding = false
        self.inputText = ""
        self.vector = []
    }
    
    func getWordEmbedding() {
        let firstWord = inputText.split(separator: " ").first ?? ""
        
        if let wordEmbedding = NLEmbedding.wordEmbedding(for: .english) {
            if let wordVector = wordEmbedding.vector(for: String(firstWord)) {
                self.vector = wordVector
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
        hasEmbedding = false
    }
}
