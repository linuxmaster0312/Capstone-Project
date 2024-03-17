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
    @Published var currentGroup: String = "default" // Current selected group
    @Published var groups: [String] = ["default"] // List of groups
    @Published var currentTitle: String = ""
    @Published var currentContent: String = ""

    func prepareNewNote() {
        currentNote = Note(title: "", content: "", organization_group: currentGroup)
        refreshID = UUID() // Update the refreshID to trigger view refresh
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
        refreshID = UUID() // Refresh the ID to trigger a UI update
    }

    func selectNote(_ note: Note) {
        currentNote = note
        currentTitle = note.title
        currentContent = note.content
        refreshID = UUID()
    }

    func selectGroup(_ group: String) {
        currentGroup = group
        refreshID = UUID() // Trigger a UI update to show notes in the selected group
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
