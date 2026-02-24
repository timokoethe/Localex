//
//  TokenizerView.swift
//  Localex
//
//  Created by Timo Köthe on 23.02.26.
//

import SwiftUI

struct TokenizerView: View {
    @State private var vm: TokenizerViewModel = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type here ...", text: $vm.inputText)
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
