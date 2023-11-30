//
//  DailyNoteEditSheet.swift
//  secondMojong
//
//  Created by Hyemi on 11/29/23.
//

import SwiftUI

struct DailyNoteEditSheet: View {
    @ObservedObject var dailyNoteViewModel: DailyNoteViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    
    @State private var noteTitle: String
    @State private var noteContent: String
    // 삭제 or 수정 버튼 누르면 뜨는 알럿 관리 변수
    @State private var isDeleteDialogShowing: Bool = false
    @State private var isEditDialogShowing: Bool = false
    
    var existingNote: DailyNoteModel
    
    var isInputValid: Bool {
        !noteTitle.isEmpty && !noteContent.isEmpty
    }
    
    init(dailyNoteViewModel: DailyNoteViewModel, dailyNote: DailyNoteModel) {
        self.dailyNoteViewModel = dailyNoteViewModel
        self.existingNote = dailyNote
        _noteTitle = State(initialValue: dailyNote.title)
        _noteContent = State(initialValue: dailyNote.content)
    }
    
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
                    TextField(
                        "제목을 입력하세요",
                        text: $noteTitle
                    )
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 18)
                    .font(.CustomFont.H3)
                    .foregroundColor(.Body1)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        TextField(
                            "ex. 흠뻑 물 주기, 지주 세우기...",
                            text: $noteContent,
                            axis: .vertical
                        )
                        .font(.CustomFont.B3)
                        .foregroundColor(.Body1)
                        Spacer()
                        Text("\(noteContent.count)/90")
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
                        self.isDeleteDialogShowing = true
                    }, label: {
                        rectangleBtn(context: "삭제하기", isFill: true, textColor: Color.White1, backgroundColor: Color.WarningRed)
                    })
                    .alert(showAlert: $isDeleteDialogShowing) {
                        AlertView(
                            title: "기록을 삭제할까요?",
                            btnIcon: Image(systemName: "checkmark.circle"),
                            cancleBtn: AlertButtonView(showAlert: $isDeleteDialogShowing, action: {}, type: .CANCEL),
                            removeBtn: AlertButtonView(showAlert: $isDeleteDialogShowing, action: {
                                deleteDailyNote()
                                presentationMode.wrappedValue.dismiss()
                            }, type: .REMOVE)
                        )
                    }

                    .background(
                        Group {
                            if isDeleteDialogShowing || isEditDialogShowing {
                                Color.black.opacity(0.5).ignoresSafeArea()
                            }
                        }
                    )
                    .overlay(
                        Group {
                            if isDeleteDialogShowing {
                                DailyNoteCustomDialog(
                                    isDialogShowing: $isDeleteDialogShowing,
                                    onDelete: deleteDailyNote
                                )
                            }
                        }
                    )
                    .padding(.trailing, 20)
                    .disabled(!isInputValid)
                    
                    Button(action: {
                        self.isEditDialogShowing = true
                    }, label: {
                        rectangleBtn(context: "수정하기", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
                    })
                    .alert(showAlert: $isEditDialogShowing) {
                        AlertView(
                            title: "기록을 수정했나요?",
                            btnIcon: Image(systemName: "checkmark.circle"),
                            cancleBtn: AlertButtonView(showAlert: $isEditDialogShowing, action: {}, type: .CANCEL),
                            completedBtn: AlertButtonView(showAlert: $isEditDialogShowing, action: {
                                updateDailyNote()
                                presentationMode.wrappedValue.dismiss()
                            }, type: .COMPLETED)
                        )
                    }
                    .disabled(!isInputValid)
                }
                .padding(.horizontal, 50)
            }
        }
        
    }
    private func updateDailyNote() {
        existingNote.title = noteTitle
        existingNote.content = noteContent
        try? context.save()
        
    }
    
    private func deleteDailyNote() {
        existingNote.title = noteTitle
        existingNote.content = noteContent
        try? context.delete(existingNote)
        presentationMode.wrappedValue.dismiss()
    }
}


// TODO:
struct DailyNoteCustomDialog: View {
    @Binding internal var isDialogShowing: Bool
    
    var onDelete: () -> Void
    
    var body: some View {
        Text("ALERT")
    }
    // 수정할거냐 삭제할거냐 알럿
}
