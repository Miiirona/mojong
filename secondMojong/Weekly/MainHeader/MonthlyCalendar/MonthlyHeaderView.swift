//
//  MonthlyCalHeaderView.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct MonthlyCalHeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showSheet: Bool = false
    @State var isShownFullScreenCover = false
    
    var body: some View {
        NavigationView {
            HStack {
                Text("제목")
                    .font(.CustomFont.H1)
                    .foregroundColor(Color.Primary)
                
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("Icon_Calendar_T")
                        .resizable()
                        .frame(width: 29, height: 31)
                })
                .fullScreenCover(isPresented: $isShownFullScreenCover) {
                    MonthlyCalView()
                }
                NavigationLink(destination: Text("작물관리 페이지")) {
                    Image("Icon_Logo")
                        .resizable()
                        .frame(width: 26, height: 28)
                }
            }
            .padding(.init(top: 0, leading: 20, bottom: 10, trailing: 22))
            
        }

    }
}


#Preview {
    MonthlyCalHeaderView()
}
