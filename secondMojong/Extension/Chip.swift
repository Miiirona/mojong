//
//  Chip.swift
//  secondMojong
//
//  Created by Hyemi on 11/22/23.
//

import SwiftUI

struct Chip: View {
    var name: String
    var isRemovable: Bool
    var isSelected: Bool
    
    var body: some View {
        HStack {
            if isSelected {
                HStack {
                    Text(name)
                        .font(.CustomFont.B2)
                        .foregroundColor(Color.White1)
                    if isRemovable{
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color.white)
                    }
                }
                .padding(10)
                .background(Color.Primary)
                .frame(height: 30)
                .cornerRadius(20)
            } else {
                HStack {
                    Text(name)
                        .font(.CustomFont.B2)
                        .foregroundColor(Color.Primary)
                    if isRemovable{
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
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
    VStack {
        Chip(name: "참외", isRemovable: false, isSelected: true)
        Chip(name: "아스파라거스", isRemovable: false, isSelected: false)
        Chip(name: "수박", isRemovable: true, isSelected: false)
        Chip(name: "쑥갓", isRemovable: true, isSelected: true)
    }
}
