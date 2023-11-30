//
//  SwiftUIView.swift
//  secondMojong
//
//  Created by Hyemi on 11/17/23.
//

import SwiftUI

struct WholeWeekView: View {
    var body: some View {
        VStack {
            WeekHeaderView()
            WeeksTabView() { week in
                VStack {
                    WeekView(week: week)
                }
            }
            .frame(height: 80)
        }
    }
}

#Preview {
    WholeWeekView()
        .environmentObject(WeekStore())
}
