//
//  SearchView.swift
//  secondMojong
//
//  Created by Hyemi on 11/27/23.
//

import SwiftUI
import WrappingHStack

struct SearchView: View {
    @State private var searchText = ""
    @Binding var crops: [Crop]
    @Binding var isAnyCropSelected: Bool
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                SearchBar(text: $searchText)
                
                WrappingHStack {
                    ForEach(crops.indices.filter({
                        return !searchText.isEmpty && HangulUtil.matchesPattern(crops[$0].name, searchText) && !crops[$0].isSelected
                    }), id: \.self) { index in
                        CropChip(name: crops[index].name, isFill: false, textColor: Color.Primary)
                            .padding(.trailing, 10)
                            .onTapGesture {
                                crops[index].isSelected = true
                                isAnyCropSelected = true
                            }
                    }
                }
//                .frame(minHeight: 120)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                VStack {
                    if !searchText.isEmpty {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.White2)
                            .padding(.vertical, 10)
                    }
                    WrappingHStack {
                        ForEach(crops.indices.filter({ crops[$0].isSelected }), id: \.self) { index in
                            CropChip(name: crops[index].name, isFill: false, textColor: Color.WarningRed, isRemovable: true)
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    crops[index].isSelected = false
                                    isAnyCropSelected = crops.contains { $0.isSelected }
                                }
                        }
                    }
                    .padding(.horizontal, 23)
                }
                
                Spacer()
            }
            if searchText.isEmpty {
                Image("APP_Logo_F")
                    .resizable()
                    .frame(width: 44, height: 52)
            }
        }
    }
}

//#Preview {
//    SearchView(isAnyCropSelected: .constant(false))
//        .previewLayout(.sizeThatFits)
//}
