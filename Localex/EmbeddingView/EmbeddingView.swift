//
//  EmbeddingView.swift
//  Localex
//
//  Created by Timo Köthe on 26.02.26.
//

import SwiftUI

struct EmbeddingView: View {
    @State private var vm: EmbeddingViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type here ...", text: $vm.inputText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(1)
                
                ScrollView {
                    Text("Dimensions: " + vm.vector.count.description)
                    ForEach(vm.vector, id: \.self) { vector in
                        Text(vector, format: .number.precision(.fractionLength(2)))
                            .foregroundStyle(.secondary)
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
