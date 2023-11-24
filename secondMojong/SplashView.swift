//
//  SwiftUIView.swift
//  Mojong
//
//  Created by Hyemi on 11/13/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("APP_Logo")
                    .resizable()
                    .frame(width: 76, height: 86)
            }
            
            .padding(.top, 280)
            .padding(.bottom, 478)
        }
    }
}

#Preview {
    SplashView()
}
