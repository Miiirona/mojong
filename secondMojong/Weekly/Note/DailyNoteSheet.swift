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
    @Published var isSaved: Bool = false
    @Published var isEditable: Bool = true
    
    @AppStorage("DailyNoteId") var savedDailyNoteId = UUID().uuidString
    @AppStorage("DailyNoteTitle") var savedDailyNoteTitle: String = ""
    @AppStorage("DailyNoteText") var savedDailyNoteText: String = ""
    @AppStorage("DailyDate") var savedDailyNoteDate: String = ""
    
    
    func saveDailyNote() {
        savedDailyNoteId = dailyNoteId
        savedDailyNoteTitle = dailyNoteTitle
        savedDailyNoteText = dailyNoteText
        isSaved = true
        isEditable = false
        
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
    @Binding var showDeleteAlert: Bool
    @Binding var showEditAlert: Bool
    
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
                        .disabled(!dailyNoteViewModel.isEditable)
                        .frame(maxWidth: .infinity)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 18)
                        .font(.CustomFont.H3)
                        .foregroundColor(.Body1)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        TextField("ex. 흠뻑 물 주기, 지주 세우기...", text: $dailyNoteViewModel.dailyNoteText, axis: .vertical)
                            .disabled(!dailyNoteViewModel.isEditable)
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
                    .contentShape(Rectangle())
                }
                .padding(.init(top: 13, leading: 41, bottom: 13, trailing: 43))
                HStack {
                    if dailyNoteViewModel.isSaved {
                        HStack {
                            Button(action: {
                                self.showDeleteAlert.toggle()
                                //삭제 로직
                            }, label: {
                                rectangleBtn(context: "삭제하기", isFill: false, textColor: Color.WarningRed)
                                    .padding(10)
                                
                            })
                            .alert(showAlert: $showDeleteAlert) {
                                AlertView(
                                    title: "기록을 삭제할까요?",
                                    btnIcon: Image(systemName: "checkmark.circle"),
                                    cancleBtn: AlertButtonView(showAlert: $showDeleteAlert, action: {}, type: .CANCEL),
                                    removeBtn: AlertButtonView(showAlert: $showDeleteAlert, action: {}, type: .REMOVE)
                                )
                            }
                            Button(action: {
                                self.showEditAlert.toggle()
                                // 수정 로직 구현
                            }, label: {
                                rectangleBtn(context: "수정하기", isFill: true, textColor: Color.White1, backgroundColor: Color.Body2)
                                    .padding(10)
                            })
                            .alert(showAlert: $showEditAlert) {
                                AlertView(
                                    title: "기록을 수정할까요?",
                                    btnIcon: Image(systemName: "checkmark.circle"),
                                    cancleBtn: AlertButtonView(showAlert: $showEditAlert, action: {}, type: .CANCEL),
                                    completedBtn: AlertButtonView(showAlert: $showEditAlert, action: {}, type: .COMPLETED)
                                )
                            }
                        }
                    } else {
                        HStack {
                            Button(action: {
                                    dailyNoteViewModel.saveDailyNote()
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    if dailyNoteViewModel.dailyNoteTitle.isEmpty {
                                        rectangleBtn(context: "기록하기", isFill: false, textColor: Color.Secondary01)
                                    } else {
                                        rectangleBtn(context: "기록하기", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
                                    }
                                })
                                .disabled(dailyNoteViewModel.dailyNoteTitle.isEmpty)
                                .padding(10)
                        }
                    }
                }
                .padding(.horizontal, 50)
                
            }
            .onAppear {
                dailyNoteViewModel.onAppearFunc()
            }
        }
        
    }
    
}


#Preview {
    DailyNoteSheet(dailyNoteViewModel: DailyNoteViewModel(), showDeleteAlert: .constant(false), showEditAlert: .constant(false))
}

