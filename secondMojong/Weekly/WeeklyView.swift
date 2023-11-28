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
    @State var showMonthView : Bool = false
    @State var showAddCrop: Bool = false
    @State var showRemoveCrop: Bool = false
    @State var showAlert: Bool = false

    
    let monthStore = MonthStore()
    
    var body: some View {
            VStack {
                MainHeaderView(mainHeaderViewModel: mainHeaderViewModel, showSelectCrop: $showSelectCrop, showMonthView: $showMonthView, showAddCrop: $showAddCrop, showRemoveCrop: $showRemoveCrop)
                if showSelectCrop {
                    if showRemoveCrop {
                        RemoveCropView(showAlert: $showAlert, showSelectCrop: $showAddCrop, showAddCrop: $showAddCrop, showRemoveCrop: $showRemoveCrop)
                    } else if showAddCrop {
                        AddCropView(showSelectCrop: $showSelectCrop, showAddCrop: $showAddCrop)
                    } else {
                        SelectCropView(showAddCrop: $showAddCrop, showRemoveCrop: $showRemoveCrop)
                    }
                }else if showMonthView {
                    MonthView()
                } else {
                    WholeWeekView()
                    DailyNoteView()
                }
                Spacer()
            }
            .padding(.top, 12)
    }
}

#Preview {
    WeeklyView()
        .environmentObject(WeekStore())
}

