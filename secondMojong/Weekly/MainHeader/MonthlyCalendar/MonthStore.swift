import SwiftUI
import Foundation

class MonthStore: ObservableObject {
    @Published var months: [Month] = []
    @Published var selectedDate: Date {
        didSet {
            calcMonths(with: selectedDate)
        }
    }

    init(with date: Date = Date()) {
        self.selectedDate = Calendar.current.startOfDay(for: date)
        calcMonths(with: selectedDate)
    }

    private func calcMonths(with date: Date) {
        months = [
            month(for: Calendar.current.date(byAdding: .month, value: -1, to: date)!, with: -1),
            month(for: date, with: 0),
            month(for: Calendar.current.date(byAdding: .month, value: 1, to: date)!, with: 1)
        ]
    }

    private func month(for date: Date, with index: Int) -> Month {
        var result: [Date] = .init()

        guard let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: date)) else {
            return .init(index: index, dates: [], referenceDate: date)
        }

        guard let range = Calendar.current.range(of: .day, in: .month, for: startOfMonth) else {
            return .init(index: index, dates: [], referenceDate: date)
        }

        range.forEach { day in
            if let dateInMonth = Calendar.current.date(byAdding: .day, value: day-1, to: startOfMonth) {
                result.append(dateInMonth)
            }
        }

        return .init(index: index, dates: result, referenceDate: date)
    }


    func selectToday() {
        select(date: Date())
    }

    func isSelectedDateToday() -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(selectedDate, inSameDayAs: Date())
    }

    func select(date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }

    func update(to direction: TimeDirection) {
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)!

        case .past:
            selectedDate = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate)!

        case .unknown:
            selectedDate = selectedDate
        }
        calcMonths(with: selectedDate)
    }
    func moveToPrevMonth() {
        guard let date = Calendar.current.date(byAdding: .month, value: -1, to: selectedDate) else { return }
        select(date: date)
    }

    func moveToNextMonth() {
        guard let date = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate) else { return }
        select(date: date)
    }
}

struct Month {
    let index: Int
    let dates: [Date]
    var referenceDate: Date
}
