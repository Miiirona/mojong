//
//  CropChipView.swift
//  secondMojong
//
//  Created by Hyemi on 11/26/23.
//

import SwiftUI

struct CropChip: View {
    var name: String
    var isFill: Bool
    var textColor: Color
    var isRemovable: Bool = false
    var isChecked: Bool = false
    var isaddable: Bool = false
    var backgroundColor: Color?
    
    var body: some View {
        if isFill {
            HStack(spacing: 5) {
                Text(name)
                    .font(.CustomFont.B2)
                    .foregroundColor(textColor)
                if isRemovable {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(textColor)
                }
            }
            .padding(10)
            .background(backgroundColor ?? Color.clear)
            .frame(height: 30)
            .cornerRadius(20)
        } else {
            HStack(spacing: 5) {
                Text(name)
                    .font(.CustomFont.B2)
                    .foregroundColor(textColor)
                if isRemovable {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(textColor)
                } else if isChecked {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 9, height: 9)
                        .foregroundColor(textColor)
                } else if isaddable {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(textColor)
                }
            }
            .padding(10)
            .frame(height: 30)
            .overlay (
                RoundedRectangle(cornerRadius: 20)
                    .stroke(textColor)
            )
        }
    }
}

#Preview {
    HStack {
        VStack {
            CropChip(name: "작물1", isFill: true, textColor: Color.White1, isRemovable: false, backgroundColor: Color.Primary)
            CropChip(name: "작물2", isFill: false, textColor: Color.Primary)
            CropChip(name: "작물3", isFill: true, textColor: Color.White1, backgroundColor: Color.WarningRed)
            CropChip(name: "작물4", isFill: false, textColor: Color.Body2)
        }
        VStack {
            CropChip(name: "작물5", isFill: false, textColor: Color.Body2, isaddable: true)
            CropChip(name: "작물6", isFill: false, textColor: Color.Primary, isChecked: true)
            CropChip(name: "작물7", isFill: false, textColor: Color.WarningRed, isRemovable: true)
            CropChip(name: "작물8", isFill: false, textColor: Color.Primary, isRemovable: true)
        }
    }
}
