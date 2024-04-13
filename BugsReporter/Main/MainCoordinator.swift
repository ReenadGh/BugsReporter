//
//  MainCoordinatorView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI


public class MainCoordinator: ObservableObject , BugsReporterParent {
    
    @Published var bugsReporterCoordinator: BugsReporterCoordinator?
    @Published var viewModel: MainViewModel!
    @Published var isBugReporterScreenActive: Bool = false
    
    init() {
        viewModel = MainViewModel(coordinator: self)
    }
    
    func openBugReporterScreen(with report: BugReport) {
        isBugReporterScreenActive = true
        bugsReporterCoordinator = .init(parent: self)
    }
    func openImagePreview() {
        bugsReporterCoordinator = .init(parent: self)
        bugsReporterCoordinator?.showSignIn = false
        bugsReporterCoordinator?.bugSubmissionCoordinator.openImagePreview(for: Image(systemName: "layybug"))
        isBugReporterScreenActive = true

    }
    
    func closeBugReporterScreen() {
        isBugReporterScreenActive = false
    }
}
