////
////  MonthlyCalHeaderView.swift
////  secondMojong
////
////  Created by Hyemi on 11/20/23.
////
//
//import SwiftUI
//
//struct MonthlyHeaderView: View {
//    
//    @ObservedObject var mainHeaderViewModel: MainHeaderViewModel
////    @Environment(\.dismiss) var dismiss
//    @Binding var showSelectCrop: Bool
//    @State var isExpanded: Bool = false
//    @State var showSheet: Bool = false
//    
//    var body: some View {
//            HStack {
//                Button(action: {
//                    showSelectCrop.toggle()
//                    isExpanded.toggle()
//                }, label: {
//                    Text("참외")
//                        .font(.CustomFont.H1)
//                        .foregroundColor(.Primary)
//                        .padding(.trailing,6)
//                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
//                        .font(Font.custom("SF Pro", size: 15))
//                        .bold()
//                        .foregroundColor(.Primary)
//                        .frame(width: 14, height: 15, alignment: .center)
//                })
//                Spacer()
//                Button(action: {
////                    dismiss()
//                    mainHeaderViewModel.isShownFullScreenCover = false
//                }, label: {
//                    Image("Icon_Logo")
//                        .resizable()
//                        .frame(width: 26, height: 28)
//                })
//
//            }
//            .padding(.init(top: 23, leading: 20, bottom: 30, trailing: 22))
//            
//
//    }
//}
//
//
////#Preview {
////    MonthlyHeaderView(showSelectCrop: .constant(true))
////}
