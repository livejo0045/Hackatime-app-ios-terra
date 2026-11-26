//
//  Hackatime_app_ios_terraApp.swift
//  Hackatime app ios terra
//
//  Created by Jonas on 26/11/2026.
//

import SwiftUI
import CoreData

@main
struct Hackatime_app_ios_terraApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
