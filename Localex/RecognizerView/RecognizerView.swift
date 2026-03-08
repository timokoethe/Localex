//
//  RecognizerView.swift
//  Localex
//
//  Created by Timo Köthe on 25.02.26.
//

import SwiftUI
import NaturalLanguage

/// A SwiftUI view that demonstrates language identification using `NLLanguageRecognizer`.
///
/// `RecognizerView` allows users to enter arbitrary text and analyze which
/// language(s) the system detects, along with their associated confidence scores.
///
/// The view is backed by `RecognizerViewModel`, which processes the input text,
/// retrieves language hypotheses, sorts them by probability, and exposes the
/// results to the UI.
///
/// UI Behavior:
/// - A `TextField` captures the user’s input text.
/// - Tapping **Recognize** calls `vm.recognize()` and performs language detection.
/// - The detected languages are displayed in descending order of confidence.
/// - Each row shows:
///   - The language code (`rawValue`)
///   - A formatted percentage value (two decimal places)
///   - A `ProgressView` visualizing the confidence score
/// - After recognition, a **Reset** button appears to clear the current state.
/// - The **Recognize** button is disabled when the input field is empty.
struct RecognizerView: View {
    @State private var vm: RecognizerViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                Typebar(inputType: .sentence, inputText: $vm.inputText)
                
                ForEach(vm.languages, id: \.key) { language, confidence in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(language.rawValue)
                            Spacer()
                            Text(confidence, format: .percent.precision(.fractionLength(2)))
                                .foregroundStyle(.secondary)
                        }
                        ProgressView(value: confidence)
                    }
                    .padding(.vertical, 4)
                }
                
                Spacer()
                
                if vm.hasRecognized {
                    Button("Reset", role: .destructive, action: vm.reset)
                        .buttonStyle(.borderedProminent)
                } else {
                    Button("Recognize") {
                        vm.recognize()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(vm.inputText.isEmpty)
                }
            }
            .navigationTitle("Recognizer")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    RecognizerView()
}
