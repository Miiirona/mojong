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
//    @State var isShownFullScreenCover = false
    @Binding var showSelectCrop: Bool
    @Binding var showMonthView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showSelectCrop.toggle()
                }, label: {
                    Text("참외")
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
                
                Spacer()
                Button(action: {
                    showMonthView.toggle()
                    if showMonthView {
                        showSelectCrop = false
                    }
//                    mainHeaderViewModel.isShownFullScreenCover.toggle()
                }, label: {
                    Image("Icon_Logo")
                        .resizable()
                        .frame(width: 26, height: 28)
                })
//                .fullScreenCover(isPresented: $mainHeaderViewModel.isShownFullScreenCover, content: {
//                    MonthlyView(mainHeaderViewModel: mainHeaderViewModel)
//                })
            }
            .padding(.init(top: 23, leading: 20, bottom: 29, trailing: 22))
            
        }

    }
}

//
//#Preview {
//    MainHeaderView(showSelectCrop: .constant(true))
//}
