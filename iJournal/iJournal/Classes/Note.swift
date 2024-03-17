//
//  File.swift
//  iJournal
//
//  Created by Josh Park on 2/16/24.
//

import Foundation

class Note: Equatable, Hashable {
    // Notes are essentially text files, notes store details on how text should be rendered as well as the content of notes
    var title: String
    var content: String
    var creationDate: Date
    var organization_group: String

    init(title: String, content: String, creationDate: Date = Date()) {
        self.title = title
        self.content = content
        self.creationDate = creationDate
        self.organization_group = "default"
    }
    
    init(title: String, content: String, organization_group: String, creationDate: Date = Date()) {
        self.title = title
        self.content = content
        self.creationDate = creationDate
        self.organization_group = organization_group
    }
    
    // Equatable
    static func == (lhs: Note, rhs: Note) -> Bool {
        // Here, we're considering them equal if all their properties match.
        return lhs.title == rhs.title && lhs.content == rhs.content && lhs.creationDate == rhs.creationDate && lhs.organization_group == rhs.organization_group
    }
    
    // Hashable
    func hash(into hasher: inout Hasher) {
        // Hash the properties that are considered in the Equatable implementation
        hasher.combine(title)
        hasher.combine(content)
        hasher.combine(creationDate)
        hasher.combine(organization_group)
    }
}
