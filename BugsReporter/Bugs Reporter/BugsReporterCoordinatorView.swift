//
//  BugsReporterCoordinatorView.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import SwiftUI

struct BugsReporterCoordinatorView: View {
    
    @ObservedObject var coordinator: BugsReporterCoordinator

    
    var body: some View {
        if coordinator.showLoading {
            ProgressView()
                .tint(Color.green.opacity(0.5))
        }else{
            
            if coordinator.showSignIn {
                SignInViewCoordinator(coordinator: coordinator.signInCoordinator)
            }else {
                BugSubmissionCoordinatorView(coordinator: coordinator.bugSubmissionCoordinator)
            }
        }
    }
}

#Preview {
    BugsReporterCoordinatorView(coordinator: .init())
}
