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
    
    var nonActiv: Bool
    var aktiv: Bool
    
    var body: some View {
        if nonActiv {
            Text("작물 삭제")
                .font(.CustomFont.B4)
                .foregroundColor(.Body3)
                .multilineTextAlignment(.center)
                .frame(width: 63, height: 11)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.Body3)
                )
        } else if aktiv {
                        Text("작물 삭제")
                .font(.CustomFont.B4)
                .foregroundColor(.warningRed)
                .multilineTextAlignment(.center)
                .frame(width: 63, height: 11)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.warningRed)
                )
                    } else {
                        Text("삭제하기")
                .font(.CustomFont.B4)
                .foregroundColor(Color.White1)
                .multilineTextAlignment(.center)
                .frame(width: 63, height: 11)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.warningRed)
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
            deleteCrop(nonActiv: true, aktiv: false)
            deleteCrop(nonActiv: false, aktiv: true)
            deleteCrop(nonActiv: false, aktiv: false)
        }
    }
}
