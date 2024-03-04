//
//  FileManagerView.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

struct NoteManagerView: View {
    @EnvironmentObject private var noteViewModel: NoteViewModel

    var body: some View {
        ScrollView {
            VStack {
                ForEach(noteViewModel.notes, id: \.self) { note in
                    Button(note.title) {
                        noteViewModel.currentNote = note
                        noteViewModel.selectNote(note)

                        // Logic to switch to TextEditorView goes here
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                }
            }
            .padding()
        }
    }
}

#Preview {
    NoteManagerView()
}
