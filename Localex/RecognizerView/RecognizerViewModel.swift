//
//  RecognizerViewModel.swift
//  Localex
//
//  Created by Timo Köthe on 25.02.26.
//

import Observation
import NaturalLanguage

@Observable
class RecognizerViewModel {
    private let recognizer: NLLanguageRecognizer
    
    var hasRecognized: Bool
    var inputText: String   // The text currently entered by the user.
    var languages: [(key: NLLanguage, value: Double)]
    
    /// Initializes all variables with their values.
    init() {
        self.recognizer = NLLanguageRecognizer()
        self.hasRecognized = false
        self.inputText = ""
        self.languages = []
    }
    
    func recognize() {
        recognizer.processString(inputText)
        languages = recognizer
            .languageHypotheses(withMaximum: 10)
            .sorted { $0.value > $1.value }
        hasRecognized = !languages.isEmpty
    }
    
    /// Resets the current session to initial values.
    ///
    /// This function resets the current view by setting all variables to their initial values.
    func reset() {
        inputText.removeAll()
        recognizer.reset()
        languages.removeAll()
        hasRecognized = false
    }
}
