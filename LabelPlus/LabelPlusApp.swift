//
//  LabelPlusApp.swift
//  LabelPlus
//
//  Created by SoreHait on 2021/11/20.
//

import SwiftUI

@main
struct LabelPlusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
