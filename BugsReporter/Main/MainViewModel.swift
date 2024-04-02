//
//  MainViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation


class MainViewModel: ObservableObject {
   
   unowned let coordinator: MainCoordinator
   
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    @MainActor func openBugSubmissionScreen() {
        coordinator.openBugSubmissionScreen()
    }
}
