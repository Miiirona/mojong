//
//  DataModel.swift
//  secondMojong
//
//  Created by Hyemi on 11/26/23.
//

import Foundation
import SwiftData

@Model
class Memo {
    @Attribute(.unique) var id = UUID()
    var MemoTitle: String
    var MemoText: String
    
    init(MemoTitle: String, MemoText: String) {
        self.MemoTitle = MemoTitle
        self.MemoText = MemoText
    }
}
