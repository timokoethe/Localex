# Localex for iOS

[![License: MIT](https://img.shields.io/badge/license-MIT-orange)](https://opensource.org/license/mit)
![Framework](https://img.shields.io/badge/SwiftUI-orange)
![Platform](https://img.shields.io/badge/Platforms-iOS-orange)
![Apple](https://img.shields.io/badge/Apple-000000?style=flat&logo=apple)

**Localex** is a lightweight SwiftUI showcase app demonstrating Apple’s [**NaturalLanguage** framework](https://developer.apple.com/documentation/naturallanguage/) for classical Natural Language Processing (NLP) tasks such as tokenization, lemmatization, language identification, and part-of-speech tagging — all fully on-device.

⚠️ **Disclaimer**: This app is intended for demonstration and learning purposes only and is not production-ready.

## ✨ Features

- 🔤 **Tokenization**: Split text into words, sentences, and paragraphs  
- 🌍 **Language Identification**: Detect the dominant language of text  
- 🧬 **Word Embeddings**: Generate and inspect the vector representation of a word
- ⚡ **On-device & Offline**: No internet connection required  
- 🎨 **Minimal SwiftUI UI**: Clean interface to visualize NLP results  

## 🛠 Manual

The app has three tabs, each backed by its own view model:

- `TokenizerViewModel` for tokenization
- `RecognizerViewModel` for language detection
- `EmbeddingViewModel` for word vectors

### 1) Tokenizer Case (`NLTokenizer`)

This case demonstrates how a text is split into discrete word units.

1. The view model creates `NLTokenizer(unit: .word)`.
2. When the user taps **Tokenize**, `inputText` is assigned to `tokenizer.string`.
3. `enumerateTokens(in:)` walks through the full string range.
4. For each token range, the app slices `inputText[range]` and appends it to `tokens`.
5. The UI renders each token as a separate `Text` row.

### 2) Language Recognizer Case (`NLLanguageRecognizer`)

This case demonstrates how Apple estimates which language(s) a text belongs to and with what confidence.

1. The view model creates `NLLanguageRecognizer()`.
2. On **Recognize**, `processString(inputText)` feeds the entire input into the recognizer.
3. The app calls `languageHypotheses(withMaximum: 10)` to get up to 10 candidates.
4. Candidates are sorted descending by probability (`Double` confidence value from 0.0 to 1.0).
5. The UI shows each language code (`rawValue`), a percentage label, and a `ProgressView`.

### 3) Embedding Case (`NLEmbedding`)

This case demonstrates how a word is mapped to a high-dimensional numeric vector that represents semantic meaning.

1. The input is split by spaces and only the first word is used.
2. The app loads `NLEmbedding.wordEmbedding(for: .english)`.
3. It requests a vector with `vector(for: firstWord)`.
4. If successful, the resulting `[Double]` is stored in `vector`.
5. The UI shows the vector dimension (`vector.count`) and each component value.
