//
//  NoteHistoryCal.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct MonthlyView: View {
    @ObservedObject var mainHeaderViewModel: MainHeaderViewModel
    @State var showSelectCrop : Bool = false

    var body: some View {
        NavigationView {
            VStack {
                // TODO: MainHeader로 바꾸기
                MonthlyHeaderView(mainHeaderViewModel: mainHeaderViewModel, showSelectCrop: $showSelectCrop)
                if showSelectCrop {
                    SelectCropView()
                } else {
                    MonthView()
                        .environmentObject(MonthStore())
                }
                Spacer()
            }
            .padding(.top, 12)
        }
    }
}

#Preview {
    MonthlyView(mainHeaderViewModel: MainHeaderViewModel())
}
