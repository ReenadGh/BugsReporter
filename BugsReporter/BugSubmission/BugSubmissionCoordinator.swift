//
//  BugSubmissionCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI

public class BugSubmissionCoordinator: ObservableObject {
    
    unowned let parent: MainCoordinator?
    
    @Published var previewCoordinator: ImagePreviewCoordinator?
    @Published var viewModel: BugSubmissionViewModel!
    var report: ScreenBug?

    init(parent: MainCoordinator?, report: ScreenBug = .init(image: nil, description: "")) {
        self.parent = parent
        viewModel = BugSubmissionViewModel(coordinator: self , report: report)
    }
    
    @MainActor func backToParent(){
        parent?.closeBugSubmissionScreen()
    }
    func openImagePreview(for image: Image)
    {
        previewCoordinator = .init(parent: self, image: image)
    }
}
