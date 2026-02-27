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
    
    /// Performs language recognition on the current input text.
    ///
    /// This function executes the full language detection cycle:
    /// - Passes `inputText` to `recognizer.processString(_:)`
    /// - Retrieves up to 10 language hypotheses using `languageHypotheses(withMaximum:)`
    /// - Sorts the resulting candidates in descending order by probability
    /// - Stores the sorted results in `languages`
    /// - Updates the state to indicate whether recognition produced any results
    ///
    /// Each hypothesis consists of a language identifier (`NLLanguage`)
    /// and a probability score (`Double`) between 0.0 and 1.0.
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
