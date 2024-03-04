//
//  NoteViewModel.swift
//  iJournal
//
//  Created by Josh Park on 2/16/24.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var refreshID = UUID()
    @Published var notes: [Note] = []
    @Published var currentNote: Note?
    @Published var currentTitle: String = ""
    @Published var currentContent: String = ""

    func prepareNewNote() {
        currentNote = Note(title: "", content: "")
        refreshID = UUID() // Update the refreshID to trigger view refresh
    }

    func saveNote(title: String, content: String) {
        if let note = currentNote, notes.contains(where: { $0 === note }) {
            // Update existing note
            note.title = title
            note.content = content
        } else {
            // Save new note
            let newNote = Note(title: title, content: content)
            notes.append(newNote)
            currentNote = newNote // Update currentNote to reference the new note
        }
        
        refreshID = UUID() // Refresh the ID to trigger a UI update
    }

    func selectNote(_ note: Note) {
        currentNote = note
        // Assuming you have currentTitle and currentContent properties
        currentTitle = note.title
        currentContent = note.content
        refreshID = UUID()
    }
}

