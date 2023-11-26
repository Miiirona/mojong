//
//  Chip.swift
//  secondMojong
//
//  Created by Hyemi on 11/22/23.
//

import SwiftUI

struct CropChip: View {
    var name: String
    var isRemovable: Bool
    var isChecked: Bool
    var isPriSelected: Bool
    var isDelSelected: Bool
    var isDelNonSelected: Bool
    var isGray: Bool
    var isaddable: Bool
    
    var body: some View {
        HStack {
            if isPriSelected {
                HStack(spacing: 5) {
                    Text(name)
                        .font(.CustomFont.B2)
                        .foregroundColor(Color.White1)
                    if isRemovable{
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(Color.white)
                    }
                }
                .padding(10)
                .background(Color.Primary)
                .frame(height: 30)
                .cornerRadius(20)
            } else if isDelSelected {
                HStack(spacing: 5) {
                    Text(name)
                        .font(.CustomFont.B2)
                        .foregroundColor(Color.White1)
                }
                .padding(10)
                .background(Color.warningRed)
                .frame(height: 30)
                .cornerRadius(20)
            } else if isDelNonSelected {
                HStack(spacing: 5) {
                    Text(name)
                        .font(.CustomFont.B2)
                        .foregroundColor(Color.warningRed)
                    if isRemovable{
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(Color.warningRed)
                    }
                }
                .padding(10)
                .frame(height: 30)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.warningRed)
                )
            } else if isGray {
                HStack(spacing: 5) {
                    Text(name)
                        .font(.CustomFont.B2)
                        .foregroundColor(Color.Body2)
                    if isaddable{
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(Color.Body2)
                    }
                }
                .padding(10)
                .frame(height: 30)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.Body2)
                )
            } else {
                HStack(spacing: 5) {
                    Text(name)
                        .font(.CustomFont.B2)
                        .foregroundColor(Color.Primary)
                    if isRemovable{
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(Color.Primary)
                    } else if isChecked {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 8, height: 8)
                                .foregroundColor(Color.Primary)
                        }
                }
                .padding(10)
                .frame(height: 30)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.Primary)
                )
            }
        }
    }
    
    
}



#Preview {
    HStack {
        VStack {
            CropChip(name: "참외", isRemovable: false, isChecked: false, isPriSelected: true, isDelSelected: false, isDelNonSelected: false, isGray: false, isaddable: false)
            CropChip(name: "아스파라거스", isRemovable: false, isChecked: false, isPriSelected: false, isDelSelected: false, isDelNonSelected: false, isGray: false, isaddable: false)
            CropChip(name: "쑥갓", isRemovable: false, isChecked: false, isPriSelected: false, isDelSelected: true, isDelNonSelected: false, isGray: false, isaddable: false)
            CropChip(name: "어떤작물", isRemovable: false, isChecked: false, isPriSelected: false, isDelSelected: false, isDelNonSelected: false, isGray: true, isaddable: false)
        }
        VStack {
            CropChip(name: "고구마", isRemovable: false, isChecked: false, isPriSelected: false, isDelSelected: false, isDelNonSelected: false, isGray: true, isaddable: true)
            CropChip(name: "아스파라거스", isRemovable: false, isChecked: true, isPriSelected: false, isDelSelected: false, isDelNonSelected: false, isGray: false, isaddable: false)
            CropChip(name: "초코송이", isRemovable: true, isChecked: false, isPriSelected: false, isDelSelected: false, isDelNonSelected: true, isGray: false, isaddable: false)
            CropChip(name: "수박", isRemovable: true, isChecked: false, isPriSelected: false, isDelSelected: false, isDelNonSelected: false, isGray: false, isaddable: false)
        }
    }
}
