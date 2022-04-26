//
//  concurrencyApp.swift
//  concurrency
//
//  Created by Luis Adrian on 4/25/22.
//

import SwiftUI

@main
struct concurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            UsersListView()
                .onAppear{
                    UserDefaults.standard.setValue(false, forKey: "UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
