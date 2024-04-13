//
//  BugsReporterCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import GoogleSignIn
import SwiftUI

public class BugsReporterCoordinator: ObservableObject {
   
    unowned let parent: BugsReporterParent?
    
    @Published var signInCoordinator: SignInCoordinator!
    @Published var bugSubmissionCoordinator: BugSubmissionCoordinator!
    @Published var showSignIn: Bool = false
    @Published var showLoading: Bool = true

    init(parent:BugsReporterParent , report:BugReport? = nil) {
        self.parent = parent
        self.signInCoordinator = .init(parent: self)
        self.bugSubmissionCoordinator = .init(parent: self, report: report)
        self.fetchUserAccess()
    }
    
    //TASK : move this logic in viewModel
        func fetchUserAccess(){
        
        AuthenticationManager.shared.fetchUserAccess { result in
            defer {
                self.showLoading = false
            }
            switch result {
            case .success(_):
                if !SheetManager.shared.isSheetAvailable {
                    self.showSignIn = true
                }
            case .failure(let error):
                print("Error restoring Google sign-in: \(error.localizedDescription)")
                self.showSignIn = true
            }
        }
    }
}


protocol BugsReporterParent: AnyObject {
    
    func openBugReporterScreen(with report: BugReport)
    
    func closeBugReporterScreen()
}
