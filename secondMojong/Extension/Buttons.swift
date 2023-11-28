//
//  Buttons.swift
//  secondMojong
//
//  Created by Hyemi on 11/24/23.
//

import Foundation
import SwiftUI

struct todayBtn: View {
    
    var isToday: Bool
    
    var body: some View {
        if isToday {
            Text("TODAY")
                .font(.CustomFont.B4)
                .foregroundColor(.Body3)
                .multilineTextAlignment(.center)
                .frame(width: 63, height: 11)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.Body3)
                )
        } else {
            Text("TODAY")
                .font(.CustomFont.B4)
                .foregroundColor(Color.White1)
                .multilineTextAlignment(.center)
                .frame(width: 63, height: 11)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.Secondary01)
                )
        }
    }
}

struct deleteCrop: View {
    
    var context: String
    var isAktiv: Bool
    var textColor: Color
    var backgroundColor: Color?
    
    var body: some View {
        if isAktiv {
            Text("\(context)")
                .font(.CustomFont.B4)
                .foregroundColor(textColor)
                .multilineTextAlignment(.center)
                .frame(width: 63, height: 11)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(textColor)
                        .fill(backgroundColor ?? Color.clear)
                )
        } else {
            Text("\(context)")
                .font(.CustomFont.B4)
                .foregroundColor(textColor)
                .multilineTextAlignment(.center)
                .frame(width: 63, height: 11)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(textColor)
                )
        }
    }
}

struct rectangleBtn: View {
    
    var context: String
    var isFill: Bool
    var textColor: Color
    var backgroundColor: Color?
    
    var body: some View {
        if isFill {
            Text("\(context)")
                .font(.CustomFont.B1)
                .foregroundColor(textColor)
                .padding(.horizontal, 26)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(backgroundColor!)
                )
        } else {
            Text("\(context)")
                .font(.CustomFont.B1)
                .foregroundColor(textColor)
                .padding(.horizontal, 26)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(textColor)
                )
        }
    }
}


#Preview {
    HStack {
        VStack{
            todayBtn(isToday: false)
            todayBtn(isToday: true)
        }
        VStack {
            deleteCrop(context: "작물 편집", isAktiv: false, textColor: Color.Body3)
            deleteCrop(context: "작물 삭제", isAktiv: false, textColor: Color.WarningRed)
            deleteCrop(context: "삭제하기", isAktiv: true, textColor: Color.White1, backgroundColor: Color.WarningRed)
        }
        VStack {
            rectangleBtn(context: "작물 추가", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
            rectangleBtn(context: "끝냈어요", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
            rectangleBtn(context: "끝냈어요", isFill: true, textColor: Color.White2, backgroundColor: Color.Back)
            rectangleBtn(context: "기록하기", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
            rectangleBtn(context: "취소하기", isFill: false, textColor: Color.Body2)
            rectangleBtn(context: "추가하기", isFill: true, textColor: Color.White1, backgroundColor: Color.Primary)
            rectangleBtn(context: "삭제하기", isFill: false, textColor: Color.WarningRed)
            rectangleBtn(context: "수정하기", isFill: true, textColor: Color.White1, backgroundColor: Color.Body2)
        }
    }
}
