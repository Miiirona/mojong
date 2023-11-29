//
//  DailyNoteSheet.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct DailyNoteSheet: View {
    @ObservedObject var dailyNoteViewModel: DailyNoteViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    
    @State private var noteTitle: String = ""
    @State private var noteContent: String = ""
    
    var isInputValid: Bool {
        !noteTitle.isEmpty
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
                        if isInputValid {
                            let newValue = DailyNoteModel(
                                saveAt: dailyNoteViewModel.dailyDate,
                                title: noteTitle,
                                content: noteContent
                            )
                            context.insert(newValue)
                            do {
                                try context.save()

                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                print("데이터 저장 중 오류 발생: \(error.localizedDescription)")
                            }
                        }
                    }, label: {
                        if isInputValid {
                                rectangleBtn(context: "기록하기", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
                            } else {
                                rectangleBtn(context: "기록하기", isFill: false, textColor: Color.Secondary01)
                            }
                    })
                    .disabled(!isInputValid)
                }
                .padding(.horizontal, 50)
            }
        }
    }
}


#Preview {
    DailyNoteSheet(dailyNoteViewModel: DailyNoteViewModel())
}

