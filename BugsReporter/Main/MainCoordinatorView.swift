//
//  MainCoordinatorView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct MainCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    
    var body: some View {
        
        ReporterContainerCoordinatorView{
            NavigationStack {
                MainView(viewModel: coordinator.viewModel)
                    .sheet(isPresented: $coordinator.isBugReporterScreenActive){
                        BugsReporterCoordinatorView(coordinator: coordinator.bugsReporterCoordinator!)
                      }
            }
        }
    }
}

#Preview {
    MainCoordinatorView(coordinator: .init())
}

