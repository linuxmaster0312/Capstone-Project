//
//  ContentViewModel.swift
//  iJournal
//
//  Created by Josh Park on 3/18/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    static let shared = ContentViewModel()
    @Published var currentlyDisplayedView = SideBarItem.textEditor
    
    enum SideBarItem: String, Identifiable, CaseIterable {
        var id: String { rawValue }
        case textEditor
        case settings
        case noteManager
    }

    public func setView(_ name: String){
        DispatchQueue.main.async {
            print("set view to \(name)")
            self.currentlyDisplayedView = SideBarItem(rawValue: name) ?? .textEditor
        }
    }
}
