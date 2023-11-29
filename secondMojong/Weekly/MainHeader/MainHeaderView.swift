//
//  HeaderView.swift
//  secondMojong
//
//  Created by Hyemi on 11/17/23.
//

import SwiftUI

class MainHeaderViewModel: ObservableObject {
    @Published var isShownFullScreenCover = false
}

struct MainHeaderView: View {
    @ObservedObject var mainHeaderViewModel: MainHeaderViewModel
    @Binding var showSelectCrop: Bool
    @Binding var showMonthView: Bool
    @Binding var showAddCrop: Bool
    @Binding var showRemoveCrop: Bool
    @EnvironmentObject var cropList: CropList
    
    var body: some View {
        HStack {
            if showAddCrop {
                Text("작물 추가")
                    .font(.CustomFont.H1)
                    .foregroundColor(.Primary)
                    .padding(.trailing,6)
            } else if showRemoveCrop {
                Text("작물 삭제")
                    .font(.CustomFont.H1)
                    .foregroundColor(.WarningRed)
                    .padding(.trailing, 6)
            } else {
                Button(action: {
                    showSelectCrop.toggle()
                    self.showAddCrop = false
                }, label: {
                    Text(cropList.currentSelectedCrop.name)
                        .font(.CustomFont.H1)
                        .foregroundColor(.Primary)
                        .padding(.trailing,6)
                    Image(systemName: showSelectCrop ? "chevron.up" : "chevron.down")
                        .font(Font.custom("SF Pro", size: 15))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.Primary)
                        .frame(width: 14, height: 15, alignment: .center)
                })
            }
            
            Spacer()
            Button {
                showMonthView.toggle()
                if showMonthView {
                    showSelectCrop = false
                }
            } label: {
                Image(showMonthView ? "HomeIcon" : "CalIcon")
                    .resizable()
                    .frame(width: 26, height: 28)
            }
            .opacity(showSelectCrop ? 0 : 1)
        }
        .padding(.init(top: 23, leading: 20, bottom: 0, trailing: 22))
    }
}

//
//#Preview {
//    MainHeaderView(showSelectCrop: .constant(true))
//}
