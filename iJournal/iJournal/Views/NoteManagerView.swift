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
        VStack {
            Picker("Select Group", selection: $noteViewModel.currentGroup) {
                ForEach(noteViewModel.groups, id: \.self) { group in
                    Text(group).tag(group)
                }
            }.padding()

            ScrollView {
                VStack {
                    ForEach(noteViewModel.notesInCurrentGroup(), id: \.self) { note in
                        Button(note.title) {
                            noteViewModel.selectNote(note)
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
}


#Preview {
    NoteManagerView()
}
