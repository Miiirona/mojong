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
    
    var modelContainer: ModelContainer = {
        let schema = Schema([Memo.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                .environmentObject(MonthStore())
                .modelContainer(modelContainer)
        }
        .modelContainer(for: Memo.self)
    }
}
