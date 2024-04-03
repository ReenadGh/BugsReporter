//
//  BugSubmissionViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI

class BugSubmissionViewModel: ObservableObject{
    
    unowned let coordinator: BugSubmissionCoordinator
    @Published var report: ScreenBug
    
    init(coordinator: BugSubmissionCoordinator, report: ScreenBug = .init(image: nil, description: "")) {
        self.coordinator = coordinator
        self.report = report
    }
    var isImageUploaded: Bool {
        return report.image != nil
    }
    
    @MainActor func backToMainScreen(){
        coordinator.backToParent()
    }
    
    @MainActor func openImagePreview(){
            if let image = report.image {
                coordinator.openImagePreview(for: image)
            }
    }
    
    func deleteImage() {
        report.image = nil
    }
}
