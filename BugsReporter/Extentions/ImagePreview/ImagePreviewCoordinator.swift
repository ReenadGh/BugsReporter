//
//  ImagePreviewCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import Foundation
import SwiftUI

public class ImagePreviewCoordinator: ObservableObject {
  
    unowned let parent: BugSubmissionCoordinator?

    @Published var image: Image
    
    init(parent:  BugSubmissionCoordinator? ,image: Image) {
        self.parent = parent
        self.image = image
    }
    
    @MainActor func backToMainScreen() {
        parent?.parent?.closeBugSubmissionScreen()
    }
}
