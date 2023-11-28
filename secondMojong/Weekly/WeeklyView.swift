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
    
    let monthStore = MonthStore()
    
    var body: some View {
        NavigationView{
            VStack {
                MainHeaderView(mainHeaderViewModel: mainHeaderViewModel, showSelectCrop: $showSelectCrop, showMonthView: $showMonthView, showAddCrop: $showAddCrop)
                if showSelectCrop {
                    if showAddCrop {
                        AddCropView(showSelectCrop: $showSelectCrop, showAddCrop: $showAddCrop)
                            .transition(.move(edge: .bottom))
                    } else {
                        SelectCropView(showAddCrop: $showAddCrop)
                            .transition(.move(edge: .bottom))
                    }
                }else if showMonthView {
                    MonthView()
                        .transition(.move(edge: .bottom))
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

