//
//  TextEditorViewModel.swift
//  iJournal
//
//  Created by Josh Park on 3/18/24.
//

import Foundation

class TextEditorViewModel: ObservableObject{
    static let shared = TextEditorViewModel()
    @Published var title = ""
    @Published var content = ""
    @Published var group = "default"
}
