//
//  SettingsView.swift
//  iJournal
//
//  Created by Josh Park on 2/14/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var noteViewModel: NoteViewModel
    var body: some View {
        VStack{
            HStack{
                Text("Keyboard Shortcuts")
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
