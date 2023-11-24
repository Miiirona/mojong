//
//  WeeklyView.swift
//  Mojong
//
//  Created by Hyemi on 11/14/23.
//

import SwiftUI

struct WeeklyView: View {
    @StateObject var mainHeaderViewModel = MainHeaderViewModel()
    @State var showSelectCrop : Bool = false

    var body: some View {
        NavigationView{
            VStack {
                MainHeaderView(mainHeaderViewModel: mainHeaderViewModel, showSelectCrop: $showSelectCrop)
                if showSelectCrop {
                    SelectCropView()
                } else {
                    WholeWeekView()
                    DailyNoteView()
                }
                Spacer()
            }
            .padding(.top, 12)
        }
    }
}

#Preview {
    WeeklyView()
        .environmentObject(WeekStore())
}

