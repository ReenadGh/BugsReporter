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
    @Published var viewModel: BugSubmissionViewModel!

    init(parent: MainCoordinator?) {
        self.parent = parent
        viewModel = BugSubmissionViewModel(coordinator: self)
    }
    
    @MainActor func backToParent(){
        parent?.closeBugSubmissionScreen()
    }
}
