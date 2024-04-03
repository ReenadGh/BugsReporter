//
//  BugSubmissionViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation

class BugSubmissionViewModel: ObservableObject{
    
    unowned let coordinator: BugSubmissionCoordinator
    @Published var report: ScreenBug?
    
    init(coordinator: BugSubmissionCoordinator, report: ScreenBug? = nil) {
        self.coordinator = coordinator
        self.report = report
    }
    
    @MainActor func backToMainScreen(){
        coordinator.backToParent()
    }
    
    @MainActor func openImagePreview(){
        if let report {
            if let image = report.image {
                coordinator.openImagePreview(for: image)
            }
        }
    }
}
