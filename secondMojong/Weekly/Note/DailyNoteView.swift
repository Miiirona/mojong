//
//  DailyNoteView.swift
//  secondMojong
//
//  Created by Hyemi on 11/17/23.
//

import SwiftUI
import SwiftData

struct DailyNoteView: View {
    @Environment(\.modelContext) var context
    @EnvironmentObject var weekStore: WeekStore
    @EnvironmentObject var dailyNoteViewModel: DailyNoteViewModel
    @State var showSheet: Bool = false
    @Query private var lists: [DailyNoteModel]
    @State private var currentDailyNote: DailyNoteModel?
    
    var body: some View {
        Button(action: {
            let selectedDate = weekStore.selectedDate
            dailyNoteViewModel.setSelectedDate(selectedDate)
            checkForExistingNote()
            showSheet.toggle()
        }, label: {
            ZStack {
                VStack(alignment: .center, spacing: 6) {
                    Text("선택된 날짜: \(dailyNoteViewModel.dailyDate, formatter: dateFormatter)")
                        .font(.CustomFont.B4)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.Body1)
                        .onReceive(weekStore.$selectedDate, perform: { value in
                            dailyNoteViewModel.setSelectedDate(value)
                        })
                    
                    if dailyNoteViewModel.isNotePresent {
                        Text("기록이 있어요")
                            .font(.CustomFont.H4)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.Secondary01)
                    } else {
                        Text("오늘 참외는 어땠나요?")
                            .font(.CustomFont.H4)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.Secondary01)
                    }
                }
                
                RoundedRectangle(cornerRadius: 15)
                    .inset(by: 0.5)
                    .stroke(Color.Body3)
                    .frame(maxWidth: .infinity, maxHeight: 89)
                    .padding(.horizontal, 16)
            }
            
            .padding(.bottom, 12)
        })
        .onReceive(weekStore.$selectedDate, perform: { value in
            dailyNoteViewModel.setSelectedDate(value)
            checkForExistingNote()
        })

        .onAppear {
            checkForExistingNote()
        }

        .sheet(isPresented: $showSheet, content: {
            if let dailyNote = currentDailyNote {
                // 이미 기록이 있는 경우 -> 편집 시트에 현재 노트를 전달
                DailyNoteEditSheet(dailyNoteViewModel: dailyNoteViewModel, dailyNote: dailyNote)
                    .presentationDetents([.fraction(0.4)])
                    .presentationCornerRadius(15)
            } else {
                // 기록이 없는 경우 -> 새 노트 시트
                DailyNoteSheet(dailyNoteViewModel: dailyNoteViewModel)
                    .presentationDetents([.fraction(0.4)])
                    .presentationCornerRadius(15)
            }
        })
    }
    
    private func checkForExistingNote() {
        let selectedDateString = dateFormatter.string(from: weekStore.selectedDate)
        
        if let existingNote = fetchDailyNote(forDate: weekStore.selectedDate) {
            currentDailyNote = existingNote
            dailyNoteViewModel.isNotePresent = true
        } else {
            currentDailyNote = nil
            dailyNoteViewModel.isNotePresent = false
        }
    }
    
    // MARK: Read
    private func fetchDailyNote(forDate date: Date) -> DailyNoteModel? {
        let dateString = dateFormatter.string(from: date)
        return lists.first { dateFormatter.string(from: $0.saveAt) == dateString }
    }
    
    // 날짜 형식 지정을 위한 DateFormatter
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        formatter.timeZone = TimeZone.current
        return formatter
    }
}

#Preview {
    DailyNoteView()
        .environmentObject(WeekStore())
    
}
