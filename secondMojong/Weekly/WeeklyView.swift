//
//  WeeklyView.swift
//  Mojong
//
//  Created by Hyemi on 11/14/23.
//

import SwiftUI

// MARK: - 12월 4일 메인
struct WeeklyView: View {
    var body: some View {
        NavigationView{
            
            VStack {
                HStack {
                        Text("참외")
                            .font(.CustomFont.H1)
                            .foregroundColor(.Primary)
                        Image(systemName: "chevron.down")
                            .font(Font.custom("SF Pro", size: 15).weight(.heavy))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.Primary)
                            .frame(width: 14, height: 15, alignment: .center)
                    Spacer()
                        Image("Icon_Calendar")
                            .resizable()
                            .frame(width: 29, height: 31)
                        NavigationLink(destination: Text("작물관리 페이지")) {
                            Image("Icon_Logo")
                                .resizable()
                                .frame(width: 24, height: 28)
                        }
                }
                .padding(.leading, 31)
                .padding(.trailing, 22)
                
                HStack {
                    HStack(alignment: .center, spacing: 13) {
                        Text ("12")
                            .font(.CustomFont.H2)
                            .kerning(2)
                            .foregroundColor(.Body1)
//                            .padding(.leading, 32)
                        // MARK: - 1~10일일 때 (상순)
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
                        // MARK: - 11~31일일 때 (중순, 하순)
                        // MARK: - 11~20일일 때 (중순)
                        //                        HStack(alignment: .center, spacing: 5) {
                        //                            Circle()
                        //                                .stroke(Color.Body2)
                        //                                .frame(width: 20, height: 20)
                        //                            ZStack {
                        //                                Circle()
                        //                                    .frame(width: 20, height: 20)
                        //                                    .foregroundColor(.Secondary01)
                        //                                Text("中")
                        //                                    .foregroundColor(.white)
                        //                                    .font(.CustomFont.K2)
                        //                            }
                        //                            Circle()
                        //                                .stroke(Color.Body2)
                        //                                .frame(width: 20, height: 20)
                        //                        }
                        // MARK: - 21~31일일 때 (하순)
                        //                        HStack(alignment: .center, spacing: 5) {
                        //                            Circle()
                        //                                .stroke(Color.Body2)
                        //                                .frame(width: 20, height: 20)
                        //                            Circle()
                        //                                .stroke(Color.Body2)
                        //                                .frame(width: 20, height: 20)
                        //                            ZStack {
                        //                                Circle()
                        //                                    .frame(width: 20, height: 20)
                        //                                    .foregroundColor(.Secondary01)
                        //                                Text("下")
                        //                                    .foregroundColor(.white)
                        //                                    .font(.CustomFont.K2)
                        //                            }
                        //                        }
                        
                        
                    }
                    
                    Spacer()
                    HStack {
                        // MARK: - TODAY 비활성화
                        ZStack {
                            Text("TODAY")
                                .font(.CustomFont.B1)
                                .foregroundColor(.Body3)
                                .multilineTextAlignment(.center)
                                .frame(width: 63, height: 11)
                            RoundedRectangle(cornerRadius: 20)
                                .inset(by: -0.5)
                                .strokeBorder(Color.Body3)
                                .frame(width: 63, height: 22)
                                .padding(.vertical, 6)
                        }
                        .padding(9)
                        // MARK: - TODAY 활성화
                        //                    ZStack {
                        //                        Text("TODAY")
                        //                            .font(.CustomFont.B1)
                        //                            .foregroundColor(.white)
                        //                            .multilineTextAlignment(.center)
                        //                            .frame(width: 63, height: 11)
                        //                        RoundedRectangle(cornerRadius: 20)
                        //                            .inset(by: -0.5)
                        //                            .strokeBorder(Color.Secondary01)
                        //                            .frame(width: 63, height: 22)
                        //                            .padding(.vertical, 6)
                        //                    }
                        //                    .padding(9)
                        
                    }
                    .padding(.trailing, 22)
                }
                .padding(.leading, 32)
                .padding(.bottom, 12)
                
                VStack(spacing: 10) {
                    HStack(alignment: .center) {
                        Text("日")
                            .font(.CustomFont.K3)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        Text("月")
                            .font(.CustomFont.K3)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        Text("火")
                            .font(.CustomFont.K3)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        Text("水")
                            .font(.CustomFont.K3)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        Text("木")
                            .font(.CustomFont.K3)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        Text("金")
                            .font(.CustomFont.K3)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        Text("土")
                            .font(.CustomFont.K3)
                            .foregroundColor(.Body3)
                            .multilineTextAlignment(.center)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                    }
                    .padding(.bottom, 12)
                    ScrollView(.horizontal) {
                        HStack(alignment: .center) {
                            Text("3")
                                .font(.CustomFont.K1)
                                .foregroundColor(.Body1)
                                .multilineTextAlignment(.center)
                                .frame(width: 20, height: 28, alignment: .center)
                                .padding(.horizontal, 10)
                            Text("4")
                                .font(.CustomFont.K1)
                                .foregroundColor(.Body1)
                                .multilineTextAlignment(.center)
                                .frame(width: 20, height: 28, alignment: .center)
                                .padding(.horizontal, 10)
                            Text("5")
                                .font(.CustomFont.K1)
                                .foregroundColor(.Body1)
                                .multilineTextAlignment(.center)
                                .frame(width: 20, height: 28, alignment: .center)
                                .padding(.horizontal, 10)
                            Text("6")
                                .font(.CustomFont.K1)
                                .foregroundColor(.Body1)
                                .multilineTextAlignment(.center)
                                .frame(width: 20, height: 28, alignment: .center)
                                .padding(.horizontal, 10)
                            Text("7")
                                .font(.CustomFont.K1)
                                .foregroundColor(.Body1)
                                .multilineTextAlignment(.center)
                                .frame(width: 20, height: 28, alignment: .center)
                                .padding(.horizontal, 10)
                            Text("8")
                                .font(.CustomFont.K1)
                                .foregroundColor(.Body1)
                                .multilineTextAlignment(.center)
                                .frame(width: 20, height: 28, alignment: .center)
                                .padding(.horizontal, 10)
                            Text("9")
                                .font(.CustomFont.K1)
                                .foregroundColor(.Body1)
                                .multilineTextAlignment(.center)
                                .frame(width: 20, height: 28, alignment: .center)
                                .padding(.horizontal, 10)
                        }
                    }
                }
                
                ZStack {
                    VStack(alignment: .center, spacing: 6) {
                        Text("12월 4일")
                            .font(Font.custom("NPS-font-Regular", size: 10))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.Body1)
                        Text("오늘 참외는 어땠나요?")
                            .font(Font.custom("NPS-font-Bold", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.Secondary01)
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color.Body3)
                        .frame(width: 329, height: 82)
                }
                .padding(.bottom, 12)
                
                VStack(alignment: .center, spacing: 12) {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(.Secondary01)
                            .frame(width: 328, height: 38)
                        Text("온상 설치하기")
                            .font(Font.custom("NPS-font-Regular", size: 14))
                            .foregroundColor(.white)
                            .padding(.leading, 12)
                    }
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(.Secondary02)
                            .frame(width: 328, height: 38)
                        HStack(alignment: .center) {
                            Image("warning_w")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("혹한과 저온")
                                .font(Font.custom("NPS-font-Regular", size: 14))
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 12)
                        
                    }
                }
                
                Spacer()
            }
            .padding(.top, 12)
            //        .padding(.horizontal, 31)
        }
    }
}
// MARK: - 12월 4일 온상 설치 클릭
// MARK: - 12월 4일 혹한과 저온 클릭
// MARK: - 12월 4일 일지작성 클릭
// MARK: - 12월 4일 일지작성 완료 메인


#Preview {
    WeeklyView()
}

