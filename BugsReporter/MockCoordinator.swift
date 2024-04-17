//
//  MockCoordinatorViews.swift
//  BugsReporter
//
//  Created by Reenad gh on 14/04/2024.
//

import Foundation


struct MockCoordinator {
    
    static let mainCoordinator = MainCoordinator()
    
    static let bugReporterCoordinator = BugsReporterCoordinator(parent: mainCoordinator)
    
    static let signInCoordinator = SignInCoordinator(parent: bugReporterCoordinator)
   
    static let bugSubmissionCoordinator = BugSubmissionCoordinator(parent: bugReporterCoordinator, report: nil)
    
}


struct MockViewModel {
    
    static let mainViewModel = MainViewModel(coordinator: MockCoordinator.mainCoordinator)
    
    static let bugSubmissionViewModel = BugSubmissionViewModel(coordinator: MockCoordinator.bugSubmissionCoordinator, report: .init())

}
