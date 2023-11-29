//
//  DailyNoteModel.swift
//  secondMojong
//
//  Created by 신정연 on 11/26/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class DailyNoteModel {
    var saveAt: Date
    var title: String
    var content: String
    
    init(
        saveAt: Date,
        title: String,
        content: String
    ) {
        self.saveAt = saveAt
        self.title = title
        self.content = content
    }
}
