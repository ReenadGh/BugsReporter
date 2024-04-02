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
        
        BugSubmissionView(viewModel: coordinator.viewModel)
    }
}
