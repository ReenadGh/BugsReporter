//
//  BugSubmissionCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI

public class BugSubmissionCoordinator: ObservableObject {
    
    unowned let parent: BugsReporterCoordinator?

    @Published var previewCoordinator: ImagePreviewCoordinator?
    @Published var viewModel: BugSubmissionViewModel!
    @Published var showSighIn: Bool = true
    
    
    init(parent: BugsReporterCoordinator ,  report: BugReport?) {
        self.parent = parent
        viewModel = BugSubmissionViewModel(coordinator: self , report: report ?? .init())
    }
    
    func openImagePreview(for image: Image){
        previewCoordinator = .init(parent: self, image: image)
    }
    
    func backToBugReporterScreen(){
        self.parent?.parent?.closeBugReporterScreen()
    }
}
