//
//  ReporterContainerViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import Foundation
import SwiftUI

class ReporterContainerViewModel: ObservableObject {
   
   unowned let coordinator: ReporterContainerCoordinator
    
    @Published var isContainerHidden: Bool = false
    var report: ScreenBug?

    init(coordinator: ReporterContainerCoordinator) {
        self.coordinator = coordinator
    }
    
    func hideContainer(){
        isContainerHidden = true
    }
    
    func showContainer(){
        isContainerHidden = false
    }
   
    func takeScreenShoot(completion: @escaping((Image?) -> Void)){
        ScreenshotManager.shared.takeScreenshot(window: UIApplication.shared.windows.first) { image in
                completion(image)
        }
    }
    
    @MainActor func openBugSubmissionView(image: Image?){
        coordinator.openBugSubmissionScreen(with: .init(image: image, description: nil))
    }
}
