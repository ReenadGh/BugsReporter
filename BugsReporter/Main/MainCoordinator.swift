//
//  MainCoordinatorView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI


@MainActor
public class MainCoordinator: ObservableObject , Identifiable {
    
    @Published var bugSubmissionCoordinator: BugSubmissionCoordinator?
    @Published var viewModel: MainViewModel!
    @Published var isBugSubmissionScreenActive: Bool = false
    
    init() {
        viewModel = MainViewModel(coordinator: self)
    }
    
    func openBugSubmissionScreen(){
        isBugSubmissionScreenActive = true
    }
    
    func closeBugSubmissionScreen(){
        isBugSubmissionScreenActive = false
    }
}
