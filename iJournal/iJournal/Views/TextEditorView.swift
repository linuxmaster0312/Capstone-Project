//
//  TextEditorView.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

struct TextEditorView: View {
    @EnvironmentObject private var noteViewModel: NoteViewModel
    @State private var title: String = ""
    @State private var content: String = ""

    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()
            TextEditor(text: $content)
                .padding()
            Button("Save") {
                noteViewModel.saveNote(title: title, content: content)
            }
            .padding()
        }
        .onAppear {
            if let currentNote = noteViewModel.currentNote {
                title = currentNote.title
                content = currentNote.content
            }
        }
    }
}


#Preview {
    TextEditorView()
}
