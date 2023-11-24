//
//  DailyModel.swift
//  secondMojong
//
//  Created by Hyemi on 11/23/23.
//

import Foundation

struct DailyModel : Identifiable, Hashable {
    
    var id: UUID
    var day : Int
    var title : String
    var memo : String
    var date: Date
}




