//
//  BugsReporterApp.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import SwiftUI

@main
struct BugsReporterApp: App {
    
    var body: some Scene {
        WindowGroup {
            
            
                MainCoordinatorView(coordinator: .init())
            
        }
    }
}
