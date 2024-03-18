//
//  KeyShortcutModel.swift
//  iJournal
//
//  Created by Josh Park on 3/18/24.
//

import Foundation
import AppKit

class KeyShortcutModel: ObservableObject{
    static let shared = KeyShortcutModel()
    
    enum TriggerKey: String {
        case optionKey = "optionKey"
        case superKey = "superKey"
        
        var modifierFlag: NSEvent.ModifierFlags {
            switch self {
            case .optionKey:
                return .option
            case .superKey:
                return .command
            }
        }
    }
    
    @Published var triggerKey: TriggerKey = .optionKey
    @Published var navToTextEditor = "1"
    @Published var navToSettings = "2"
    @Published var navToNoteManager = "3"
    @Published var newNoteFunction = "4"
    @Published var clearNotesFunction = "5"
    @Published var newGroupFunction = "6"
    @Published var saveNoteFunction = "7"
}
