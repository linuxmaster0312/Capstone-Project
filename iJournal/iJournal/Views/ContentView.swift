//
//  ContentView.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var noteViewModel: NoteViewModel
    
    @State var sideBarVisibility: NavigationSplitViewVisibility = .doubleColumn
    @State var selectedSideBarItem: SideBarItem = .textEditor
    @State private var showingNewGroupAlert = false
    @State private var newGroupName = ""

    enum SideBarItem: String, Identifiable, CaseIterable {
        var id: String { rawValue }
        case textEditor
        case settings
        case noteManager
    }
    
    var body: some View {
        ZStack{
            NavigationSplitView(columnVisibility: $sideBarVisibility) {
                List(SideBarItem.allCases, id: \.self, selection: $selectedSideBarItem) { item in
                    Text(item.rawValue.localizedCapitalized)
                        .tag(item)
                }
                .listStyle(SidebarListStyle())
            }  detail: {
                switch selectedSideBarItem {
                case .textEditor:
                    TextEditorView()
                        .environmentObject(noteViewModel)
                        .id(noteViewModel.refreshID)
                case .settings:
                    SettingsView()
                        .environmentObject(noteViewModel)
                case .noteManager:
                    NoteManagerView()
                        .environmentObject(noteViewModel)
                        .id(noteViewModel.refreshID)
                }
            }
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        self.showingNewGroupAlert = true
                    }) {
                        Text("New Group")
                    }
                    Button(action:{
                        noteViewModel.clearAllNotes()
                    }) {
                        Text("Clear Notes")
                    }
                    Button(action: {
                        noteViewModel.prepareNewNote()
                        selectedSideBarItem = .textEditor
                        print("Contents of notes array: \(noteViewModel.notes)")
                    }) {
                        Text("New Note")
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showingNewGroupAlert) {
            GroupAddSheetView(isPresented: $showingNewGroupAlert, newGroupName: $newGroupName) {
                noteViewModel.addGroup(newGroupName)
                newGroupName = ""
            }
        }
        .onChange(of: noteViewModel.currentNote) { _ in
            selectedSideBarItem = .textEditor
        }
    }
}

#Preview {
    ContentView()
}

