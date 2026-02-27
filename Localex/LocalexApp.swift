//
//  LocalexApp.swift
//  Localex
//
//  Created by Timo Köthe on 23.02.26.
//

import SwiftUI

/// The main application entry point.
///
/// `LocalexApp` defines the app’s lifecycle using the SwiftUI `App` protocol.
/// It creates a single `WindowGroup` scene that displays the `ContentView`
/// as the root view of the application.
///
/// This is where the app launches and sets up its initial UI.
@main
struct LocalexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
