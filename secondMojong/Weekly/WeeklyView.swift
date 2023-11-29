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
    @EnvironmentObject var cropList: CropList
    @StateObject var monthStore = MonthStore()
    
    var body: some View {
            VStack {
                if cropList.crops.isEmpty {
                    HStack {
                        Text("작물 추가")
                            .font(.CustomFont.H1)
                            .foregroundColor(.Primary)
                            .padding(.trailing,6)
                        Spacer()
                    }
                    .padding(.init(top: 23, leading: 20, bottom: 0, trailing: 22))
                    AddCropView(showSelectCrop: $showSelectCrop, showAddCrop: $showAddCrop)
                } else {
                    MainHeaderView(mainHeaderViewModel: mainHeaderViewModel, showSelectCrop: $showSelectCrop, showMonthView: $showMonthView, showAddCrop: $showAddCrop, showRemoveCrop: $showRemoveCrop)
                    if showSelectCrop {
                        if showRemoveCrop {
                            RemoveCropView(showAlert: $showAlert, showSelectCrop: $showAddCrop, showAddCrop: $showAddCrop, showRemoveCrop: $showRemoveCrop)
                        } else if showAddCrop {
                            AddCropView(showSelectCrop: $showSelectCrop, showAddCrop: $showAddCrop)
                        } else {
                            SelectCropView(showAddCrop: $showAddCrop, showRemoveCrop: $showRemoveCrop, showSelectCrop: $showSelectCrop)
                        }
                    } else if showMonthView {
                        MonthView()
                    } else {
                        WholeWeekView()
                        DailyNoteView()
                        TaskListView()
                    }
                }
                Spacer()
            }
            .padding(.top, 12)
    }
}

struct TaskListView: View {
    @EnvironmentObject var weekStore: WeekStore
    @EnvironmentObject var cropList: CropList
    
    var body: some View {
        let month = Calendar.current.component(.month, from: weekStore.selectedDate)
        let day = Calendar.current.component(.day, from: weekStore.selectedDate)
        let selectedCrop = cropList.currentSelectedCrop
                
        if day < 11 {
            ForEach(selectedCrop.schedule[month - 1].first, id: \.title) { task in
                TaskCellView(title: task.title, detail: task.detail, type: .schedule)
            }
            ForEach(selectedCrop.problem[month - 1].first, id: \.title) { task in
                TaskCellView(title: task.title, detail: task.detail, type: .problem)
            }
        } else if day < 21 {
            ForEach(selectedCrop.schedule[month - 1].middle, id: \.title) { task in
                TaskCellView(title: task.title, detail: task.detail, type: .schedule)
            }
            ForEach(selectedCrop.problem[month - 1].middle, id: \.title) { task in
                TaskCellView(title: task.title, detail: task.detail, type: .problem)
            }
        } else {
            ForEach(selectedCrop.schedule[month - 1].last, id: \.title) { task in
                TaskCellView(title: task.title, detail: task.detail, type: .schedule)
            }
            ForEach(selectedCrop.problem[month - 1].last, id: \.title) { task in
                TaskCellView(title: task.title, detail: task.detail, type: .problem)
            }
        }
    }
}

struct TaskCellView: View {
    var title: String
    var detail: String?
    var type: TaskType
    @State private var showModal: Bool = false
    
    var body: some View {
        Button {
            showModal.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundStyle(type == .schedule ? Color.green : Color.orange)
                    .frame(width: 300, height: 50)
                Text(title)
            }
            
        }
        .disabled(detail == nil)
        .sheet(isPresented: $showModal) {
            Text(detail!)
                .presentationDetents([.fraction(0.4)])
                .presentationCornerRadius(15)
        }

    }
}

enum TaskType {
    case schedule
    case problem
}

#Preview {
    WeeklyView()
        .environmentObject(WeekStore())
}

