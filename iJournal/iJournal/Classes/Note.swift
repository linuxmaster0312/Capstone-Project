//
//  File.swift
//  iJournal
//
//  Created by Josh Park on 2/16/24.
//

import Foundation

class Note{
    //Notes are essentially text files, notes store details on how text should be rendered as well as the content of notes
    var title: String
    var content: String
    var creationDate: Date

    init(title: String, content: String, creationDate: Date = Date()) {
        self.title = title
        self.content = content
        self.creationDate = creationDate
    }
}
