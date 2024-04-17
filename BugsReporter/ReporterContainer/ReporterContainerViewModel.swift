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
    
    @Published var isFlagHidden: Bool = false
    @Published var isCapturing = false

    var report: BugReport?

    init(coordinator: ReporterContainerCoordinator) {
        self.coordinator = coordinator
    }
    
    var backgroundColor: Color {
        return isCapturing ? .darkGreen : .white
    }
   
    func takeScreenShoot(completion: @escaping((UIImage?) -> Void)){
        ScreenshotManager.shared.takeScreenshot(window: UIApplication.shared.windows.first) { image in
                completion(image)
        }
    }
    
     private func openBugSubmissionView(image: UIImage?){
        coordinator.openBugReporterScreen(with: .init(image: image, description: ""))
    }
    
    func takeScreenshotAndNavigate() {
        self.isFlagHidden = true

        // Begin the capture process
        withAnimation(.easeIn(duration: 0.2)) {
            isCapturing = true
        }
        // Simulate taking a screenshot
        self.takeScreenShoot { image in
            
            // Delay to simulate the "blink" effect
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeOut(duration: 0.2)) {
                    self.isCapturing = false
                }
            }
            // Delay to navigate after the "blink"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.openBugSubmissionView(image: image)
                self.isFlagHidden = false
            }
        }

    }
}
