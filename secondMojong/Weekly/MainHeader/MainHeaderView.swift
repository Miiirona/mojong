//
//  HeaderView.swift
//  secondMojong
//
//  Created by Hyemi on 11/17/23.
//

import SwiftUI

struct MainHeaderView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
            HStack {
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Text("참외")
                        .font(.CustomFont.H1)
                        .foregroundColor(.Primary)
                        .padding(.trailing,6)
                    Image(systemName: "chevron.down")
                        .font(Font.custom("SF Pro", size: 15))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.Primary)
                        .frame(width: 14, height: 15, alignment: .center)
                })
                .sheet(isPresented: $showSheet, content: {
                    SelectCropSheet()
                        .presentationDetents([.fraction(0.4)])
                        .presentationCornerRadius(15)
                })
                
                Spacer()
                Image("Icon_Calendar")
                    .resizable()
                    .frame(width: 29, height: 31)
                NavigationLink(destination: Text("작물관리 페이지")) {
                    Image("Icon_Logo")
                        .resizable()
                        .frame(width: 26, height: 28)
                }
            }
            .padding(.init(top: 0, leading: 20, bottom: 10, trailing: 22))

    }
}

struct SelectCropSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.White1
                .ignoresSafeArea()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.Body2)
                    .font(Font.custom("SF Pro", size: 16))
                    .fontWeight(.semibold)
                    .padding()
                
            })
        }
    }
}

#Preview {
    MainHeaderView()
}
