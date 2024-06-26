//
//  ReporterContainerCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import Foundation
import SwiftUI


@MainActor
public class ReporterContainerCoordinator: ObservableObject , Identifiable {
    
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
    func closeBugSubmissionScreen(){
        bugsReporterCoordinator = nil
        isBugReporterShown = false
    }
}
