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
    
    init() {
        viewModel = MainViewModel(coordinator: self)
    }
    
    func openBugReporterScreen(with report: BugReport) {
        bugsReporterCoordinator = .init(parent: self)
    }
    
    func closeBugReporterScreen() {
        bugsReporterCoordinator = nil
    }
}
