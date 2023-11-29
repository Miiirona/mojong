//
//  SearchCropSheet.swift
//  secondMojong
//
//  Created by Hyemi on 11/26/23.
//

import SwiftUI

struct AddCropView: View {
    @State private var showAlert: Bool = false
    @Binding var showSelectCrop: Bool
    @Binding var showAddCrop: Bool
    @State private var isAnyCropSelected: Bool = false
    @State var crops: [Crop] = [cherryTomato, koreanMelon, cabbage, chiliPepper, lettuce, leafMustard, grape, eggplant]
    @EnvironmentObject var cropList: CropList
    
    var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Image("CropViewPot")
                        .resizable()
                        .frame(width: 18, height: 15)
                    Text("새로운 작물을 추가하세요")
                        .font(.CustomFont.B3)
                        .foregroundColor(Color.Body2)
                    Spacer()
                    Button(action: {
                        self.showSelectCrop = true
                        self.showAddCrop = false
                    }, label: {
                        deleteCrop(context: "취소하기", isAktiv: false, textColor: Color.Body3)
                    })
                    .opacity(cropList.crops.isEmpty ? 0 : 1)
                    .frame(width: 40)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .padding(.init(top: 0, leading: 24, bottom: 10, trailing: 24))
                
                SearchView(crops: $crops, isAnyCropSelected: $isAnyCropSelected)
                    .padding(.horizontal, 16)
                Spacer()
                
                Button(action: {
                    self.showAlert.toggle()
                }, label: {
                    rectangleBtn(context: "작물 추가", 
                                 isFill: isAnyCropSelected, 
                                 textColor: isAnyCropSelected ? Color.White1 : Color.Secondary01,
                                 backgroundColor: isAnyCropSelected ? Color.Secondary01 : Color.clear)
                               })
                .disabled(!isAnyCropSelected)
                .alert(showAlert: $showAlert) {
                    AlertView(
                        title: "작물을 추가할까요?",
                        btnIcon: Image(systemName: "checkmark.circle"),
                        cancleBtn: AlertButtonView(
                            showAlert: $showAlert,
                            action: {},
                            type: .CANCEL),
                        completedBtn: AlertButtonView(
                            showAlert: $showAlert,
                            action: {
                                // TODO: 배열에 추가할 떄 중복 검사 필요!
                                for crop in crops {
                                    if crop.isSelected {
                                        if cropList.crops.isEmpty {
                                            cropList.currentSelectedCrop = crop
                                        }
                                        cropList.crops.append(crop)
                                    }
                                }
                                self.showAddCrop = false
                            },
                            type: .COMPLETED)
                    )
                }
                .padding(.bottom, 40)
            }
    }
}

#Preview {
    AddCropView(showSelectCrop: .constant(false), showAddCrop: .constant(false))
}

