//
//  ContentView.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @State var sideBarVisibility: NavigationSplitViewVisibility = .doubleColumn
    @State var selectedSideBarItem: SideBarItem = .textEditor

    enum SideBarItem: String, Identifiable, CaseIterable {
        var id: String { rawValue }
        case textEditor
        case settings
        case noteManager
    }
    
    var body: some View {
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
            case .settings:
                SettingsView()
            case .noteManager:
                NoteManagerView()
            }
        }
    }
}

#Preview {
    ContentView()
}

