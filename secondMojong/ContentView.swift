//
//  ContentView.swift
//  secondMojong
//
//  Created by Hyemi on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weekStore = WeekStore()
    @State private var showMainView = false
    var body: some View {
        if showMainView {
            WeeklyView()
                .environmentObject(weekStore)
        } else {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            showMainView = true
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WeekStore())

}
