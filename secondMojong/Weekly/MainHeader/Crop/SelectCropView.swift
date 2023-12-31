//
//  SelectCropView.swift
//  secondMojong
//
//  Created by Hyemi on 11/20/23.
//

import SwiftUI
import WrappingHStack

struct SelectCropView: View {
    @Binding var showAddCrop: Bool
    @Binding var showRemoveCrop: Bool
    @Binding var showSelectCrop: Bool
    let columns = [GridItem(.adaptive(minimum: 100))]
    @EnvironmentObject var cropList: CropList
        
    var body: some View {
        VStack {
            HStack {
                Image("CropViewPot")
                    .resizable()
                    .frame(width: 18, height: 15)
                Text("어떤 작물을 캘린더에 표시할까요?")
                    .font(.CustomFont.B3)
                    .foregroundColor(Color.Body2)
                Spacer()
                Button(action: {
                    showRemoveCrop.toggle()
                }, label: {
                    deleteCrop(context: "작물 삭제", isAktiv: false, textColor: Color.WarningRed)
                })
                .frame(width: 40)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding(.init(top: 0, leading: 24, bottom: 18, trailing: 24))
            if cropList.crops.isEmpty {
                Text("아직 추가된 작물이 없어요")
            } else {
                WrappingHStack {
                    ForEach(cropList.crops, id: \.name) { crop in
                        Button {
                            cropList.currentSelectedCrop = crop
                            showSelectCrop.toggle()
                        } label: {
                            if cropList.currentSelectedCrop.name == crop.name {
                                CropChip(name: crop.name, isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
                                    .padding(.trailing, 10)
                            } else {
                                CropChip(name: crop.name, isFill: false, textColor: Color.Secondary01)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                }
                .frame(minWidth: 344)
                .padding(.leading, 23)

            }
            
            Spacer()
            
            Button(action: {
                showAddCrop.toggle()
            }, label: {
                rectangleBtn(context: "작물 추가", isFill: true, textColor: Color.White1, backgroundColor: Color.Secondary01)
            })
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    SelectCropView(showAddCrop: .constant(false), showRemoveCrop: .constant(false), showSelectCrop: .constant(false))
}
