//
//  ReporterContainerCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import Foundation
import SwiftUI


public class ReporterContainerCoordinator: ObservableObject, IdentifiableHashable ,BugsReporterParent {
    
    @Published var bugsReporterCoordinator: BugsReporterCoordinator?
    @Published var viewModel: ReporterContainerViewModel!
    @Published var isBugReporterShown:Bool = false
    
    init() {
        viewModel = ReporterContainerViewModel(coordinator: self)
    }
    
    func openBugReporterScreen(with report: BugReport){
        bugsReporterCoordinator = .init(parent: self, report: report)
        isBugReporterShown = true
    }
    
    func closeBugReporterScreen() {
        bugsReporterCoordinator = nil
        isBugReporterShown = false
    }
}
