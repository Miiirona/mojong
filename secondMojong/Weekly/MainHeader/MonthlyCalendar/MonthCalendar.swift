//
//  MonthCalendar.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI
import SwiftData
import Foundation

struct MonthlyCalendar: View {
    @Environment(\.modelContext) private var context
    @Binding var selectedMonth: Date
    @Binding var selectedDate: Date

    let week = ["일", "월", "화", "수", "목", "금", "토"]

    var dateOfMonth: [Date] {
        generateDatesOfMonth(for: selectedMonth)!
    }

    var body: some View {
        ScrollView {
            HStack {
                ForEach(week, id: \.self) { i in
                    Text(i)
                        .frame(maxWidth: .infinity)
                }
            }

            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 0) {
                let start = dateOfMonth[0].getWeekDay()
                let end = start + dateOfMonth.count

                ForEach(0...41, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .frame(width: 60, height: 60)
                        .overlay {
                            if (index >= start && index < end){
                                let i = index - start
                                Text(DateFormatter.dayFormatter.string(from: dateOfMonth[i]))
                                    .foregroundStyle(Calendar.current.isDate(dateOfMonth[i], equalTo: Date(), toGranularity: .day) ? Color.cyan : Color.primary)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.3)){
                                            selectedDate = dateOfMonth[i]
                                        }
                                    }
                                    .background(
                                        Circle()
                                            .fill(Calendar.current.isDate(dateOfMonth[i], equalTo: selectedDate, toGranularity: .day) ? Color.cyan : Color.clear)
                                            .opacity(0.4)
                                            .frame(width: 35, height: 35)
                                    )
                            }else {
                                Text("")
                            }
                        }
                }
            }
        }
    }
}


func generateDatesOfMonth(for selectedMonth: Date) -> [Date]? {
    let calendar = Calendar.current

    guard
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedMonth)),
        let endOfMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth)?.addingTimeInterval(-1)
    else {
        return nil
    }
    
    var dates: [Date] = []
    var currentDate = startOfMonth

    while currentDate <= endOfMonth {
        dates.append(currentDate)
        
        if let nextDate = calendar.date(byAdding: .day, value: 1, to: currentDate) {
            currentDate = nextDate
        } else {
            break
        }
    }
    
    return dates
}


#Preview {
    MonthlyCalendar(selectedMonth: .constant(Date()), selectedDate: .constant(Date()))
}
