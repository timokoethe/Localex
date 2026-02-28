//
//  TokenizerView.swift
//  Localex
//
//  Created by Timo Köthe on 23.02.26.
//

import SwiftUI

/// A SwiftUI view that demonstrates word-level tokenization using `NLTokenizer`.
///
/// `TokenizerView` provides a simple interface where users can enter text,
/// trigger tokenization, and inspect the resulting word tokens.
///
/// The view is backed by `TokenizerViewModel`, which manages the input text,
/// performs the tokenization logic, and stores the resulting tokens.
///
/// UI Behavior:
/// - A `TextField` allows users to enter arbitrary text.
/// - Tapping **Tokenize** calls `vm.tokenize()` and splits the input into word tokens.
/// - Each token is displayed as a separate `Text` row.
/// - After tokenization, a **Reset** button appears to clear the current state.
/// - The **Tokenize** button is disabled when the input field is empty.
struct TokenizerView: View {
    @State private var vm: TokenizerViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type sentence here ...", text: $vm.inputText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(1)
                
                ForEach(vm.tokens, id: \.self) { token in
                    Text(token)
                }
                
                Spacer()
                
                if vm.hasTokenized {
                    Button("Reset", role: .destructive, action: vm.reset)
                        .buttonStyle(.borderedProminent)
                } else {
                    Button("Tokenize") {
                        vm.tokenize()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(vm.inputText.isEmpty)
                }
            }
            .navigationTitle("Tokenizer")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    TokenizerView()
}
