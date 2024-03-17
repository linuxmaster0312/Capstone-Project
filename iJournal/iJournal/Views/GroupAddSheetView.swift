//
//  GroupAddSheetView.swift
//  iJournal
//
//  Created by Josh Park on 3/17/24.
//

import SwiftUI

struct GroupAddSheetView: View {
    @Binding var isPresented: Bool
    @Binding var newGroupName: String
    var addGroupAction: () -> Void

    var body: some View {
        VStack {
            TextField("New Group Name", text: $newGroupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Group") {
                addGroupAction()
                isPresented = false
            }
            .padding()
        }
        .padding()
    }
}


//#Preview {
//    GroupAddSheetView()
//}
