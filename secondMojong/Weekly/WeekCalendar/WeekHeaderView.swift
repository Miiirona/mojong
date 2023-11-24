//
//  WeekHeaderView.swift
//  InfiniteWeekView
//
//  Created by Philipp Knoblauch on 13.05.23.
//

import SwiftUI

struct WeekHeaderView: View {
    @EnvironmentObject var weekStore: WeekStore
    @State var showDatePicker: Bool = false

    var body: some View {
        HStack {
            Text(weekStore.selectedDate.monthToString())
                .font(.CustomFont.H2)
                .fontWeight(.heavy)
                .foregroundColor(.Body1)
                .padding(.trailing, 10)
            if let day = Int(weekStore.selectedDate.toString(format: "d")) {
                        if day <= 10 {
                            HStack(alignment: .center, spacing: 5) {
                                ZStack {
                                    Circle()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.Secondary01)
                                    Text("上")
                                        .foregroundColor(.white)
                                        .font(.CustomFont.K2)
                                }
                                Circle()
                                    .stroke(Color.Body2)
                                    .frame(width: 20, height: 20)
                                Circle()
                                    .stroke(Color.Body2)
                                    .frame(width: 20, height: 20)
                            }
                        } else if day <= 20 {
                            HStack(alignment: .center, spacing: 5) {
                                Circle()
                                    .stroke(Color.Body2)
                                    .frame(width: 20, height: 20)
                                ZStack {
                                    Circle()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.Secondary01)
                                    Text("中")
                                        .foregroundColor(.white)
                                        .font(.CustomFont.K2)
                                }
                                Circle()
                                    .stroke(Color.Body2)
                                    .frame(width: 20, height: 20)
                            }
                        } else {
                            HStack(alignment: .center, spacing: 5) {
                                Circle()
                                    .stroke(Color.Body2)
                                    .frame(width: 20, height: 20)
                                Circle()
                                    .stroke(Color.Body2)
                                    .frame(width: 20, height: 20)
                                ZStack {
                                    Circle()
                                        .frame(width: 20, height: 20)
                                    .foregroundColor(.Secondary01)
                                    Text("下")
                                    .foregroundColor(.white)
                                    .font(.CustomFont.K2)
                                }
                            }
                        }
                    }
            Spacer()
            Button {
                withAnimation {
//                    weekStore.selectToday()
                    if !weekStore.isSelectedDateToday() {
                                weekStore.selectToday()
                            }
                }
            } label: {
                if weekStore.isSelectedDateToday() {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: -0.5)
                            .strokeBorder(Color.Body3)
                            .frame(width: 63, height: 23)
                            .padding(9)
                        Text("TODAY")
                            .font(.CustomFont.B2)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 63, height: 11)
                    }
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: -0.5)
                            .foregroundColor(Color.Secondary01)
                            .frame(width: 63, height: 22)
                            .padding(9)
                        Text("TODAY")
                            .font(.CustomFont.B2)
                            .foregroundColor(Color.White1)
                            .multilineTextAlignment(.center)
                            .frame(width: 63, height: 11)
                    }

                }
            }
        }
        .padding(.init(top: 0, leading: 28, bottom: 0, trailing: 10))
    }
}

struct WeekHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WeekHeaderView()
            .environmentObject(WeekStore())
    }
}
