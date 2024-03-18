//
//  ContentView.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var noteViewModel: NoteViewModel
    @ObservedObject private var contentViewModel =  ContentViewModel.shared
    @ObservedObject private var keyShortCutModel = KeyShortcutModel.shared
    @State var sideBarVisibility: NavigationSplitViewVisibility = .doubleColumn
    @State private var showingNewGroupAlert = false
    @State private var newGroupName = ""

    var body: some View {
        ZStack{
            NavigationSplitView(columnVisibility: $sideBarVisibility) {
                List(ContentViewModel.SideBarItem.allCases, id: \.self, selection: $contentViewModel.currentlyDisplayedView) { item in
                    Text(item.rawValue.localizedCapitalized)
                        .tag(item)
                }
                .listStyle(SidebarListStyle())
            }  detail: {
                switch contentViewModel.currentlyDisplayedView {
                case .textEditor:
                    TextEditorView()
                        .environmentObject(noteViewModel)
                case .settings:
                    SettingsView()
                        .environmentObject(noteViewModel)
                case .noteManager:
                    NoteManagerView()
                        .environmentObject(noteViewModel)
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
        .onAppear{ //Shortcut monitor
            NSEvent.addLocalMonitorForEvents(matching: .keyDown) { (event) -> NSEvent? in
                if event.modifierFlags.contains(keyShortCutModel.triggerKey.modifierFlag), let characters = event.charactersIgnoringModifiers {
                    switch characters {
                    case keyShortCutModel.navToTextEditor:
                        contentViewModel.setView("textEditor")
                        return nil
                        
                    case keyShortCutModel.navToSettings:
                        contentViewModel.setView("settings")
                        return nil
                        
                    case keyShortCutModel.navToNoteManager:
                        contentViewModel.setView("noteManager")
                        
                    case keyShortCutModel.newNoteFunction:
                        noteViewModel.prepareNewNote()
                        return nil
                        
                    case keyShortCutModel.clearNotesFunction:
                        noteViewModel.clearAllNotes()
                        return nil
                        
                    case keyShortCutModel.newGroupFunction:
                        self.showingNewGroupAlert = true
                        return nil
                        
                    default:
                        break
                    }
                }
                return event
            }
        }
    }
}

#Preview {
    ContentView()
}

