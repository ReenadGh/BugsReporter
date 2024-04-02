//
//  MainCoordinatorView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import SwiftUI

struct MainCoordinatorView: View {
   
    @ObservedObject var coordinator: MainCoordinator
    
    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        
        NavigationStack {
            
            MainView(viewModel: coordinator.viewModel)
            
                .navigationDestination(isPresented: $coordinator.isBugSubmissionScreenActive) {
                    BugSubmissionCoordinatorView(coordinator: coordinator.bugSubmissionCoordinator)
            }
        }
    }
}

#Preview {
    MainCoordinatorView(coordinator: .init())
}
