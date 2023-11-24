//
//  WeekView.swift
//  InfiniteWeekView
//
//  Created by Philipp Knoblauch on 13.05.23.
//

import SwiftUI

extension Date {
    func monthToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self)
    }

    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateFormat = format

        return formatter.string(from: self)
    }

    func weekDayAbbrev(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP") // 일본어 로케일 설정
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE") // 요일을 한자로 표시
        
        return dateFormatter.string(from: self)
    }

    
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }

    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    private func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        var customCalendar = Calendar(identifier: .gregorian)
        customCalendar.firstWeekday = 2

        return customCalendar.isDate(self, equalTo: date, toGranularity: component)
    }

    func isInSameWeek(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .weekOfYear)
    }

    func isInSameDay(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .day)
    }
}

struct WeekView: View {
    @EnvironmentObject var weekStore: WeekStore

    var week: Week

    var body: some View {
        HStack {
            ForEach(0..<7) { i in
                VStack(spacing: 11) {
                    Text(week.dates[i].weekDayAbbrev(format: "EEE").uppercased())
                        .font(.CustomFont.K3)
                        .foregroundColor(.Body3)
                        .multilineTextAlignment(.center)
                        .frame(width: 20, height: 20)
//                    Spacer()
//                        .frame(height: 12)
                    
                    VStack(spacing: 0) {
                        Text(week.dates[i].toString(format: "d"))
                            .font(.CustomFont.K1)
                            .foregroundColor(.Body1)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 28, alignment: .center)
//                            .foregroundColor(week.dates[i] == week.referenceDate ? .white : .primary)
                            Rectangle()
                                .foregroundColor(week.dates[i] == week.referenceDate ? .Secondary01 : .clear)
                                .frame(width: 20, height: 4, alignment: .center)
                                .cornerRadius(10)
                                .padding(.leading, 1)
                    }
                    
                }.onTapGesture {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        weekStore.selectedDate = week.dates[i]
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 15)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(week: .init(index: 1, dates:
                                [
                                    Date().yesterday.yesterday.yesterday,
                                    Date().yesterday.yesterday,
                                    Date().yesterday,
                                    Date(),
                                    Date().tomorrow,
                                    Date().tomorrow.tomorrow,
                                    Date().tomorrow.tomorrow.tomorrow
                                ],
                             referenceDate: Date()))
        .environmentObject(WeekStore())
    }
}
