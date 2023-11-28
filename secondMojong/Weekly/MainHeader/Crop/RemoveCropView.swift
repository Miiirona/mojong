//
//  RemoveCropView.swift
//  secondMojong
//
//  Created by Hyemi on 11/27/23.
//

import SwiftUI

struct RemoveCropView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("CropViewBrokenPot")
                    .resizable()
                    .frame(width: 18, height: 15)
                Text("삭제할 작물을 선택하세요")
                    .font(.CustomFont.B3)
                    .foregroundColor(Color.Body2)
                Spacer()
                Button(action: {
                    
                }, label: {
                    deleteCrop(context: "취소하기", isAktiv: false, textColor: Color.Body3)
                })
                .frame(width: 40)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding(.init(top: 0, leading: 24, bottom: 18, trailing: 24))
            
            Spacer()
            
            Button(action: {
                self.showAlert.toggle()
                //작물 삭제 액션 추가
            }, label: {
                rectangleBtn(context: "작물 삭제", isFill: false, textColor: Color.WarningRed)
            })
            .alert(showAlert: $showAlert) {
                AlertView(
                    title: "내 작물을 삭제할까요?",
                    btnIcon: Image(systemName: "checkmark.circle"),
                    cancleBtn: AlertButtonView(showAlert: $showAlert, action: {}, type: .CANCEL),
                    removeBtn: AlertButtonView(showAlert: $showAlert, action: {}, type: .REMOVE)
                )
            }
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    RemoveCropView()
}
