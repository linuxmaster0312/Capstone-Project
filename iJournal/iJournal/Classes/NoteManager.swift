//
//  NoteManager.swift
//  iJournal
//
//  Created by Josh Park on 2/16/24.
//

import Foundation

class NoteManager{
    //manages adding, removing, retrieving, and saving notes
    var notes: [Note] = []
        
        func add(note: Note) {
            notes.append(note)
        }
        
        func remove(at index: Int) {
            guard index >= 0 && index < notes.count else {
                return
            }
            notes.remove(at: index)
        }
        
        func update(at index: Int, with note: Note) {
            guard index >= 0 && index < notes.count else {
                return
            }
            notes[index] = note
        }
}
