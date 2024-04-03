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
    @Published var isCapturing = false

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
    
    @MainActor private func openBugSubmissionView(image: Image?){
        coordinator.openBugSubmissionScreen(with: .init(image: image, description: ""))
    }
    
    func takeScreenshotAndNavigate() {
        // Begin the capture process
        withAnimation(.spring(duration: 0.8)) {
            isCapturing = true
        }
        self.isContainerHidden = true
        // Simulate taking a screenshot
        self.takeScreenShoot { image in
            
            // Delay to simulate the "blink" effect
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.spring(duration: 0.2)) {
                    self.isCapturing = false
                }
            }
            // Delay to navigate after the "blink"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.openBugSubmissionView(image: image)
            }
        }
    }
}
