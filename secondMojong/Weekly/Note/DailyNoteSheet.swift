//
//  DailyNoteSheet.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

class DailyNoteViewModel : ObservableObject {
    @Published var dailyModel: DailyModel?
    @Published var dailyNoteId: String = ""
    @Published var dailyNoteTitle: String = ""
    @Published var dailyNoteText: String = ""
    @Published var dailyDate: Date = Date()
    @Published var recordedDate: String = ""
    
    @AppStorage("DailyNoteId") var savedDailyNoteId = UUID().uuidString
    @AppStorage("DailyNoteTitle") var savedDailyNoteTitle: String = ""
    @AppStorage("DailyNoteText") var savedDailyNoteText: String = ""
    @AppStorage("DailyDate") var savedDailyNoteDate: String = ""
    
    func saveDailyNote() {
        savedDailyNoteId = dailyNoteId
        savedDailyNoteTitle = dailyNoteTitle
        savedDailyNoteText = dailyNoteText
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        savedDailyNoteDate = recordedDate
    }
    
    func onAppearFunc() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        
        if recordedDate == savedDailyNoteDate {
            dailyNoteTitle = savedDailyNoteTitle
            dailyNoteText = savedDailyNoteText
            if let date = formatter.date(from: savedDailyNoteDate) {
                dailyDate = date
            }
        } else {
            dailyNoteTitle = ""
            dailyNoteText = ""
        }
    }
}

struct DailyNoteSheet: View {
    @ObservedObject var dailyNoteViewModel: DailyNoteViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var noteData
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color.White1
                    .ignoresSafeArea()
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 5)
                    .foregroundColor(Color.Back)
                    .padding(.top, 7)
            }
            VStack {
                VStack(spacing: 0) {
                    TextField("제목을 입력하세요", text: $dailyNoteViewModel.dailyNoteTitle)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 18)
                        .font(.CustomFont.H3)
                        .foregroundColor(.Body1)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        TextField("ex. 흠뻑 물 주기, 지주 세우기...", text: $dailyNoteViewModel.dailyNoteText, axis: .vertical)
                            .font(.CustomFont.B3)
                            .foregroundColor(.Body1)
                        Spacer()
                        Text("\(dailyNoteViewModel.dailyNoteText.count)/90")
                            .font(.CustomFont.B5)
                            .foregroundColor(.Body3)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .frame(width: 308, height: 137, alignment: .topLeading)
                    .background(Color.Back)
                    //백그라운드 컬러 설정이 이상함
                    .cornerRadius(6)
                }
                .padding(.init(top: 20, leading: 41, bottom: 23, trailing: 43))
                HStack {
                    Button(action: {
                        dailyNoteViewModel.saveDailyNote()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("기록하기")
                            .font(.CustomFont.B1)
                            .foregroundColor(.White1)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 8)
                            .background(Color.secondary01)
                            .cornerRadius(8)
                    })
                }
                .padding(.horizontal, 50)
                
            }
            .onAppear {
                dailyNoteViewModel.onAppearFunc()
            }
        }
        
    }
    
}

//
//#Preview {
//    DailyNoteSheet()
//}
