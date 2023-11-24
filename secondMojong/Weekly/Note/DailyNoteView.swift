//
//  DailyNoteView.swift
//  secondMojong
//
//  Created by Hyemi on 11/17/23.
//

import SwiftUI

struct DailyNoteView: View {
    @EnvironmentObject var weekStore: WeekStore
    @StateObject var dailyNoteViewModel = DailyNoteViewModel()
    @State var showSheet: Bool = false
    
//    @AppStorage("DailyNoteTitle") private var savedDailyNoteTitle: String = ""
//    @AppStorage("DailyNoteText") private var savedDailyNoteText: String = ""
    
    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            ZStack {
                VStack(alignment: .center, spacing: 6) {
                    Text(weekStore.selectedDate.toString(format: "MM월 dd일"))
                        .font(.CustomFont.B2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.Body1)
                        .onReceive(weekStore.$selectedDate, perform: { value in
                            let formatter = DateFormatter()
                            formatter.dateFormat = "MM월 dd일"
                            dailyNoteViewModel.recordedDate = formatter.string(from: value)
                        })
                        
                    
//                    if dailyNoteViewModel.savedDailyNoteTitle.isEmpty && dailyNoteViewModel.savedDailyNoteText.isEmpty {
                    if dailyNoteViewModel.savedDailyNoteDate == weekStore.selectedDate.toString(format: "MM월 dd일") {
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
        .sheet(isPresented: $showSheet, content: {
            DailyNoteSheet(dailyNoteViewModel: dailyNoteViewModel)
                .presentationDetents([.fraction(0.4)])
                .presentationCornerRadius(15)
        })
        
    }
}


#Preview {
    DailyNoteView()
        .environmentObject(WeekStore())
    
}
