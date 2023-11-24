//
//  MonthView.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI

struct WeekdayView: View {
    let weekdays = ["日", "月", "火", "水", "木", "金", "土"]

    var body: some View {
        ForEach(0..<7) { index in
            Text(weekdays[index])
                .frame(width: 20, height: 20)
                .padding(.init(top: 10, leading: 10, bottom: 12, trailing: 10))
                .font(.CustomFont.K3)
                .foregroundColor(Color.Body3)
        }
    }
}


struct DateView: View {
    @EnvironmentObject var monthStore: MonthStore

    var body: some View {
        let firstDayOfWeekday = monthStore.months[1].dates.first!.dayNumberOfWeek()
                       ForEach(Array(repeating: 0, count: (firstDayOfWeekday + 6) % 7), id: \.self) { _ in
                           Text("")
                       }
        ForEach(monthStore.months[1].dates, id: \.self) { date in
            VStack(alignment: .center, spacing: 2.3) {
                Text(date.toString(format: "d"))
                    .font(.CustomFont.K1)
                    .foregroundColor(Color.Body1)
                    .frame(width: 20, height: 28, alignment: .center)
                    .foregroundColor(monthStore.selectedDate.isInSameDay(as: date) ? Color.white : Color.black)
                    .onTapGesture {
                        monthStore.select(date: date)
                    }
                Rectangle()
                    .foregroundColor(monthStore.selectedDate.isInSameDay(as: date) ? .Secondary01 : .clear)
                    .frame(width: 20, height: 4, alignment: .center)
                    .cornerRadius(10)
                    .padding(.leading, 1)
            }
            .padding(.init(top: 2.6, leading: 10, bottom: 9.3, trailing: 10))
        }
    }
}

struct MonthView: View {
    @EnvironmentObject var monthStore: MonthStore
    
    @State private var dragAmount: CGFloat = 0

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(monthStore.selectedDate.toString(format: "MM")) // 월과 연도 표시
                    .font(.CustomFont.H2)
                    .foregroundColor(Color.Body1)
                Text("月")
                    .font(Font.custom("HiraMaruProN-W4", size: 22))
                    .foregroundColor(Color.Body1)
                Spacer()
                Button {
                    withAnimation {
                        if !monthStore.isSelectedDateToday() {
                            monthStore.selectToday()
                        }
                    }
                } label: {
                    if monthStore.isSelectedDateToday() {
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
            .padding(.init(top: 0, leading: 24, bottom: 0, trailing: 8))
            VStack {
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                    WeekdayView()
                }
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                    DateView()
                }
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.dragAmount = gesture.translation.width
                        }
                        .onEnded { _ in
                            if self.dragAmount > 0 {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    self.monthStore.moveToPrevMonth()
                                }
                            } else {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    self.monthStore.moveToNextMonth()
                                }
                            }
                            self.dragAmount = 0
                        }
                )
            }

            .padding(.trailing, 13)
            .padding(.leading, 12)
            Spacer()
        }

    }
}



struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
            .environmentObject(MonthStore())
    }
}

