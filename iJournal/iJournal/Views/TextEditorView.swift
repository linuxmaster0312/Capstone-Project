//
//  TextEditorView.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

struct TextEditorView: View {
    @EnvironmentObject private var noteViewModel: NoteViewModel
    @ObservedObject private var textEditorViewModel = TextEditorViewModel.shared

    var body: some View {
        VStack {
            HStack{
                TextField("Title", text: $textEditorViewModel.title)
                    .padding()
                Picker("Set Group", selection: $textEditorViewModel.group) {
                    ForEach(noteViewModel.groups, id: \.self) { group in
                        Text(group).tag(group)
                    }
                }.padding()
            }
            TextEditor(text: $textEditorViewModel.content)
                .padding()
            Button("Save") {
                noteViewModel.saveNote(title: textEditorViewModel.title, content: textEditorViewModel.content, group: textEditorViewModel.group)
            }
            .padding()
        }
        .onAppear {
            if let currentNote = noteViewModel.currentNote {
                textEditorViewModel.title = currentNote.title
                textEditorViewModel.content = currentNote.content
            }
        }
    }
}


#Preview {
    TextEditorView()
}
