//
//  NoteViewModel.swift
//  iJournal
//
//  Created by Josh Park on 2/16/24.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var currentNote: Note?
    @Published var currentGroup: String = "default" // Current selected group
    @Published var groups: [String] = ["default"] // List of groups
    @Published var currentTitle: String = ""
    @Published var currentContent: String = ""

    func prepareNewNote() {
        self.currentNote = Note(title: "", content: "", organization_group: self.currentGroup)
        self.currentTitle = ""
        self.currentContent = ""
        TextEditorViewModel.shared.title = ""
        TextEditorViewModel.shared.content = ""
        TextEditorViewModel.shared.group = ""
        ContentViewModel.shared.setView("textEditor")
    }

    func saveNote(title: String, content: String, group: String) {
        if let note = currentNote, notes.contains(where: { $0 === note }) {
            // Update existing note
            note.title = title
            note.content = content
            note.organization_group = group
        } else {
            // Save new note
            let newNote = Note(title: title, content: content, organization_group: group)
            notes.append(newNote)
            currentNote = newNote // Update currentNote to reference the new note
            if !groups.contains(group) {
                groups.append(group) // Add new group if it doesn't exist
            }
        }
    }

    func selectNote(_ note: Note) {
        DispatchQueue.main.async {
            print("selected note")
            self.currentNote = note
            self.currentTitle = note.title
            self.currentContent = note.content
            ContentViewModel.shared.setView("textEditor")
        }
    }

    func selectGroup(_ group: String) {
        currentGroup = group
    }
    
    func notesInCurrentGroup() -> [Note] {
        return notes.filter { $0.organization_group == currentGroup }
    }
    
    func clearAllNotes() {
        notes = []
    }
    
    func addGroup(_ group: String) {
        self.groups.append(group)
        self.currentGroup = group
    }
}
