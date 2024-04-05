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
        
        ReporterContainerView{
            NavigationStack {
                MainView(viewModel: coordinator.viewModel)
            }
        }
    }
}

#Preview {
    MainCoordinatorView(coordinator: .init())
}

