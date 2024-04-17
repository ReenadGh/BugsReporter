//
//  BugSubmissionCoordinatorView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import SwiftUI

struct BugSubmissionCoordinatorView: View {
    
    @ObservedObject var coordinator: BugSubmissionCoordinator

    var body: some View {
            NavigationStack {
                BugSubmissionView(viewModel: coordinator.viewModel)
                    .navigation(item: $coordinator.previewCoordinator) { coordinator in
                        ImagePreviewView(coordinator: coordinator)
            }
        }
    }
}

#Preview {
    NavigationView {
        BugSubmissionCoordinatorView(coordinator: MockCoordinator.bugSubmissionCoordinator)
    }
}
