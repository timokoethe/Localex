//
//  EmbeddingView.swift
//  Localex
//
//  Created by Timo Köthe on 26.02.26.
//

import SwiftUI

/// A SwiftUI view that demonstrates word embeddings using `NLEmbedding`.
///
/// `EmbeddingView` allows users to enter text and generate the semantic
/// vector representation of the first word in the input.
///
/// The view is backed by `EmbeddingViewModel`, which loads the appropriate
/// word embedding model, retrieves the vector for the given word,
/// and exposes the resulting numeric components to the UI.
///
/// UI Behavior:
/// - A `TextField` captures the user’s input text.
/// - Tapping **Embedding** calls `vm.getWordEmbedding()` to retrieve
///   the vector representation of the first word.
/// - The total vector dimension (`vector.count`) is displayed.
/// - Each component of the resulting `[Double]` vector is rendered
///   as a formatted numeric value (two decimal places).
/// - The results are shown inside a `ScrollView` to accommodate
///   high-dimensional vectors.
/// - After a vector is generated, a **Reset** button appears
///   to clear the current state.
/// - The **Embedding** button is disabled when the input field is empty.
struct EmbeddingView: View {
    @State private var vm: EmbeddingViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type word here ...", text: $vm.inputText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(1)
                
                Text("Dimension: " + vm.vector.count.description)
                
                ScrollView {
                    ForEach(vm.vector, id: \.self) { vector in
                        HStack {
                            Text(vector, format: .number.precision(.fractionLength(2)))
                                .foregroundStyle(.secondary)
                            Spacer()
                        }
                    }
                }
                .scrollBounceBehavior(.basedOnSize)

                
                Spacer()
                
                if vm.hasEmbedding {
                    Button("Reset", role: .destructive, action: vm.reset)
                        .buttonStyle(.borderedProminent)
                } else {
                    Button("Embedding") {
                        vm.getWordEmbedding()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(vm.inputText.isEmpty)
                }
            }
            .navigationTitle("Embedding")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    EmbeddingView()
}
