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
    
    init() {
        viewModel = ReporterContainerViewModel(coordinator: self)
    }
    
    func openBugSubmissionScreen(with report: ScreenBug){
        bugsReporterCoordinator = .init()
    }
}
