//
//  SelectCropView.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct SelectCropView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("Pot_Gray")
                    .resizable()
                    .frame(width: 18, height: 15)
                Text("어떤 작물을 캘린더에 표시할까요?")
                    .font(.CustomFont.B3)
                    .foregroundColor(Color.Body2)
                Spacer()
                Button(action: {
                    
                }, label: {
                    deleteCrop(context: "작물 편집", isAktiv: false, textColor: Color.Body3)
                })
                .frame(width: 40)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding(.init(top: 0, leading: 24, bottom: 18, trailing: 24))
            Spacer()
            Button(action: {
//                self.showAlert.toggle()
            }, label: {
                rectangleBtn(context: "작물 추가", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
            })
//            .alert(showAlert: $showAlert) {
//                AlertView(
//                    title: "작물 추가 완료됩니다.",
//                    btnIcon: Image(systemName: "checkmark.circle"),
//                    cancleBtn: AlertButtonView(showAlert: $showAlert, action: {}, type: .CANCEL),
//                    completedBtn: AlertButtonView(showAlert: $showAlert, action: {}, type: .COMPLETED)
//                )
//            }
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    SelectCropView()
}
