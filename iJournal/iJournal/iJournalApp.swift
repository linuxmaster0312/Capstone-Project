//
//  iJournalApp.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

@main
struct iJournalApp: App {
    @ObservedObject var noteViewModel = NoteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(noteViewModel)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
