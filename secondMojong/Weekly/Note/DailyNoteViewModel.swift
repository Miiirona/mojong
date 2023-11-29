//
//  DailyNoteViewModel.swift
//  secondMojong
//
//  Created by 신정연 on 11/26/23.
//

import Foundation
import SwiftUI
import SwiftData

class DailyNoteViewModel : ObservableObject {
    @Environment(\.modelContext) private var context
    @Query private var selectedList: [DailyNoteModel]
    
    @Published var dailyDate: Date = Date()
    // 선택한 날짜에 기존 노트가 있는지
    @Published var isNotePresent = false
    @Published var savedDailyNoteDate: String = ""
    
    var dailyNotes: [DailyNoteModel] = []
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    // 현재 선택된 날짜에 해당하는 노트를 반환하는 프로퍼티
    var currentDailyNote: DailyNoteModel? {
        dailyNotes.first(where: { note in
            dateFormatter.string(from: note.saveAt) == savedDailyNoteDate
        })
    }
    
    func setSelectedDate(_ date: Date) {
        dailyDate = date
        let formattedDate = dateFormatter.string(from: date)
        savedDailyNoteDate = formattedDate
        checkForExistingNote()
        //        _selectedList.update()
    }
    
    private func checkForExistingNote() {
        // 'savedDailyNoteDate'를 사용하여 선택된 날짜를 문자열로 변환
        let selectedDateStr = dateFormatter.string(from: dailyDate)

        isNotePresent = dailyNotes.contains { note in
            dateFormatter.string(from: note.saveAt) == selectedDateStr
        }
    }
}
