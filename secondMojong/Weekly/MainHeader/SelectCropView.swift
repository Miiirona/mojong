//
//  SelectCropView.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct SelectCropSheet: View {
    var body: some View {
        HStack {
            Image("Pot_Gray")
                .resizable()
                .frame(width: 18, height: 15)
            Text("어떤 작물을 캘린더에 표시할까요?")
                .font(.CustomFont.B1)
                .foregroundColor(Color.Body2)
            Spacer()
            Button(action: {
                
            }, label: {
                Text("수정")
                    .font(.CustomFont.B2)
                    .foregroundColor(Color.Body3)
            })
            .frame(width: 40)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .padding(.init(top: 0, leading: 24, bottom: 18, trailing: 9))
    }
}

#Preview {
    SelectCropSheet()
}
