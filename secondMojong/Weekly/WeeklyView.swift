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
        
        ScrollView {
            
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
}

struct TaskCellView: View {
    @State var title: String
    @State var detail: String? = nil
    @State var type: TaskType
    @State private var showModal: Bool = false
    
    var body: some View {
        Button {
            showModal.toggle()
        } label: {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(type == .schedule ? Color.Secondary01 : Color.Body3)
                    .frame(width: 350, height: 50)
                    .cornerRadius(10)
                HStack {
                    if type == .problem {
                        Image(systemName: "exclamationmark.triangle")
                            .resizable()
                            .frame(width: 19, height: 19)
                            .foregroundColor(Color.Body1)
                    }
                    Text(title)
                        .font(.CustomFont.B3)
                        .foregroundColor(type == .schedule ? Color.White1 : Color.Body1)
                }
                .padding(.leading, 13)
            }
            
        }
        .sheet(isPresented: $showModal) {
            TaskSheetView(title: $title, detail: $detail, type: $type)
        }
        
    }
}

struct TaskSheetView: View {
    @Binding var title: String
    @Binding var detail: String?
    @Binding var type: TaskType
    
    var body: some View {
        ZStack {
            ZStack (alignment: .top) {
                Color.White1
                    .ignoresSafeArea()
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 5)
                    .foregroundColor(Color.Back)
                    .padding(.top, 7)
            }
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    if type == .problem {
                        Image(systemName: "exclamationmark.triangle")
                            .resizable()
                            .frame(width: 19, height: 19)
                            .foregroundColor(Color.WarningRed)
                            .padding(.trailing, 7)
                    }
                    Text(title)
//                        .frame(minWidth: 0, maxWidth: .infinity)
                    //                    .lineLimit(1)
                        .multilineTextAlignment(.center)
                        .font(.CustomFont.H3)
                        .foregroundColor(.Body1)
                }
                .padding(.bottom, 18)
                Text(detail ?? "")
                    .font(.CustomFont.B3)
                    .foregroundColor(.Body1)
                    .frame(width: 308, height: 137, alignment: .topLeading)
                    .background(Color.clear)
            }
            .presentationDetents([.fraction(0.4)])
            .presentationCornerRadius(15)
            .padding(.init(top: 20, leading: 41, bottom: 23, trailing: 43))
        }
    }
}

enum TaskType {
    case schedule
    case problem
}

//#Preview {
//    WeeklyView()
//        .environmentObject(WeekStore())
//}

//#Preview {
//    TaskCellView(title: "title", type: .problem)
//}

//#Preview {
//    TaskSheetView(title: .constant("title"), detail: .constant("detail"), type: .constant(.problem))
//}

#Preview {
    TaskListView()
}
