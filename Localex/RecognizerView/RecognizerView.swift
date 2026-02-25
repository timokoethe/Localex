//
//  RecognizerView.swift
//  Localex
//
//  Created by Timo Köthe on 25.02.26.
//

import SwiftUI
import NaturalLanguage

struct RecognizerView: View {
    @State private var vm: RecognizerViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type here ...", text: $vm.inputText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(1)
                
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
