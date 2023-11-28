//
//  SelectCropView.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct SelectCropView: View {
    @Binding var showAddCrop: Bool
        
    var body: some View {
        VStack {
            HStack {
                Image("CropViewPot")
                    .resizable()
                    .frame(width: 18, height: 15)
                Text("어떤 작물을 캘린더에 표시할까요?")
                    .font(.CustomFont.B3)
                    .foregroundColor(Color.Body2)
                Spacer()
                Button(action: {
                    //RemoveCropView 띄우기
                }, label: {
                    deleteCrop(context: "작물 삭제", isAktiv: false, textColor: Color.Body3)
                })
                .frame(width: 40)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding(.init(top: 0, leading: 24, bottom: 18, trailing: 24))
            Spacer()
            Button(action: {
                showAddCrop.toggle()
            }, label: {
                rectangleBtn(context: "작물 추가", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
            })
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    SelectCropView(showAddCrop: .constant(false))
}
