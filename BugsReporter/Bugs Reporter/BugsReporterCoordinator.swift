//
//  BugsReporterCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import GoogleSignIn
import SwiftUI

public class BugsReporterCoordinator: ObservableObject, IdentifiableHashable {
   
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
    
    func backToReporterContainer(){
        parent?.closeBugReporterScreen()
    }
    
    func openSignInScreen() {
        self.showSignIn = true
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
                    self.openSignInScreen()
                }
            case .failure(let error):
                print("Error restoring Google sign-in: \(error.localizedDescription)")
                self.openSignInScreen()
            }
        }
    }
}


protocol BugsReporterParent: AnyObject {
    
    func openBugReporterScreen(with report: BugReport)
    
    func closeBugReporterScreen()
}
