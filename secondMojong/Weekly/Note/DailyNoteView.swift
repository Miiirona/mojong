//
//  DailyNoteView.swift
//  secondMojong
//
//  Created by Hyemi on 11/17/23.
//

import SwiftUI

struct DailyNoteView: View {
    @EnvironmentObject var weekStore: WeekStore

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 6) {
                Text(weekStore.selectedDate.toString(format: "MM월 dd일"))
                    .font(.CustomFont.B2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.Body1)
                Text("오늘 참외는 어땠나요?")
                    .font(.CustomFont.H4)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.Secondary01)
            }
            RoundedRectangle(cornerRadius: 15)
                .inset(by: 0.5)
                .stroke(Color.Body3)
                .frame(maxWidth: .infinity, maxHeight: 89)
                .padding(.horizontal, 16)
        }
        .padding(.bottom, 12)
    }
}

#Preview {
    DailyNoteView()
        .environmentObject(WeekStore())

}
