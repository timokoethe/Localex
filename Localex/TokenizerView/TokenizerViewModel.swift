//
//  TokenizerViewModel.swift
//  Localex
//
//  Created by Timo Köthe on 23.02.26.
//

import Observation
import NaturalLanguage

@Observable
class TokenizerViewModel {
    private let tokenizer: NLTokenizer
    
    var hasTokenized: Bool
    var inputText: String   // The text currently entered by the user.
    var tokens: [Substring] // The individual tokens extracted from the input text by the tokenizer.
    
    /// Initializes all variables with their values.
    init() {
        self.tokenizer = NLTokenizer(unit: .word)
        self.hasTokenized = false
        self.inputText = ""
        self.tokens = []
    }
    
    
    /// Tokenizes the user’s current input text into word-level tokens.
    ///
    /// This function performs the full tokenization cycle:
    /// - Assigns the current `inputText` to the tokenizer
    /// - Enumerates all word ranges within the text
    /// - Extracts each token and appends it to the `tokens` array
    /// - Updates the state to indicate that tokenization has completed
    func tokenize() {
        tokenizer.string = inputText
        tokenizer.enumerateTokens(in: inputText.startIndex..<inputText.endIndex) { range, _ in
            let token = inputText[range]
            tokens.append(token)
            return true
        }
        
        hasTokenized = !tokens.isEmpty
    }
    
    /// Resets the current session to initial values.
    ///
    /// This function resets the current view by setting all variables to their initial values.
    func reset() {
        inputText.removeAll()
        tokens.removeAll()
        tokenizer.string?.removeAll()
        hasTokenized = false
    }
}
