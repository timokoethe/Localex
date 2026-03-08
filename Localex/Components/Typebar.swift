//
//  Typebar.swift
//  Localex
//
//  Created by Timo Köthe on 08.03.26.
//

import SwiftUI

struct Typebar: View {
    let inputType: InputType
    @Binding var inputText: String
    
    var body: some View {
        TextField(inputType.rawValue, text: $inputText)
            .textFieldStyle(.roundedBorder)
            .lineLimit(1)
    }
}

#Preview {
    @Previewable @State var inputText: String = ""
    Typebar(inputType: .sentence, inputText: $inputText)
    Typebar(inputType: .word, inputText: $inputText)
}

enum InputType: String {
    case sentence = "Type sentence here ..."
    case word = "Type word here ..."
}
