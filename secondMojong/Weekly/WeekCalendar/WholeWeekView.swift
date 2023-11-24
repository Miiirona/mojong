//
//  SwiftUIView.swift
//  secondMojong
//
//  Created by Hyemi on 11/17/23.
//

import SwiftUI

struct WeekCalView: View {
    var body: some View {
        VStack {
            WeekHeaderView()
            WeeksTabView() { week in
                WeekView(week: week)
            }
            .frame(height: 80)
        }
    }
}

#Preview {
    WeekCalView()
        .environmentObject(WeekStore())
}
