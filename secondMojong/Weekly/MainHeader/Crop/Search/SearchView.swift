//
//  SearchView.swift
//  secondMojong
//
//  Created by Hyemi on 11/27/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var crops: [Crop] = [cherryTomato, koreanMelon, cabbage, chiliPepper, lettuce, leafMustard, grape, eggplant]
    @Binding var isAnyCropSelected: Bool
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(text: $searchText)
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(crops.indices.filter({ !searchText.isEmpty && crops[$0].name.contains(searchText) && !crops[$0].isSelected }), id: \.self) { index in
                        Button(action: {
                            crops[index].isSelected = true
                            isAnyCropSelected = true
                        }) {
                            CropChip(name: crops[index].name, isFill: false, textColor: Color.Primary)
                                .padding(.top, 0)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 23)
                .frame(height: 120)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.White2)
                .padding(.vertical, 10)
            
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(crops.indices.filter({ crops[$0].isSelected }), id: \.self) { index in
                        Button(action: {
                            crops[index].isSelected = false
                            isAnyCropSelected = crops.contains { $0.isSelected }
                        }) {
                            CropChip(name: crops[index].name, isFill: false, textColor: Color.WarningRed, isRemovable: true)
                                .padding(.top)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 23)
            }
        }
    }
}

#Preview {
    SearchView(isAnyCropSelected: .constant(false))
}
