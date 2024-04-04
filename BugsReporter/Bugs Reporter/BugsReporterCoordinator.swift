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
        
    @Published var signInCoordinator: SignInCoordinator!
    @Published var bugSubmissionCoordinator: BugSubmissionCoordinator!
    @Published var showSignIn: Bool = false
    @Published var showLoading: Bool = true

    init() {
        self.signInCoordinator = .init(parent: self)
        self.bugSubmissionCoordinator = .init(parent: nil)
        self.fetchUserAccess()
    }
    
    //TASK : reflect this logic in viewModel
    
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
        
//            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
//                             if let error = error {
//                                 print("Error restoring Google sign-in: \(error.localizedDescription)")
//
//                             } else if let user = user {
//                                 print("User restored: \(user.profile?.name ?? "Unknown")")
//                                 self.showLodaing = false
//                                 guard self.sheetKey != nil else {
//                                     return
//                                 }
//                                 self.showSighIn = true
//                             }
//        }
    }
}


