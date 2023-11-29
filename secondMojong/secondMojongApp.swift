//
//  secondMojongApp.swift
//  secondMojong
//
//  Created by Hyemi on 11/16/23.
//


import SwiftUI
import SwiftData

@main
struct secondMojongApp: App {
    
    private var container: ModelContainer
    @StateObject var dailyNoteViewModel = DailyNoteViewModel()
    
    init() {
        do {
            container = try ModelContainer(
                for: DailyNoteModel.self
            )
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                .environmentObject(MonthStore())
                .modelContainer(container)
                .environmentObject(dailyNoteViewModel)
        }
    }
}

