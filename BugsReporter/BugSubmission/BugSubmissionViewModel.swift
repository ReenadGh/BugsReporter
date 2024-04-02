//
//  BugSubmissionViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation

class BugSubmissionViewModel: ObservableObject{
    
    unowned let coordinator: BugSubmissionCoordinator

    init(coordinator: BugSubmissionCoordinator) {
        self.coordinator = coordinator
    }
    
    @MainActor func backToMainScreen(){
        coordinator.backToParent()
    }
}
