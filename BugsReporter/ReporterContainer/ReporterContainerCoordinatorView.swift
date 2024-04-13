//
//  ReporterContainerCoordinatorView.swift
//  BugsReporter
//
//  Created by Reenad gh on 07/04/2024.
//

import Foundation


import SwiftUI

struct ReporterContainerCoordinatorView<Content: View>: View {
        
    let content: Content
    @ObservedObject var coordinator = ReporterContainerCoordinator()
    
    init(@ViewBuilder content: () -> Content) {
         self.content = content()
     }
    
    var body: some View {
        NavigationStack {

        ReporterContainerView(viewModel: coordinator.viewModel){
                content
            }
        .navigationDestination(isPresented: $coordinator.isBugReporterShown) {
            BugsReporterCoordinatorView(coordinator: coordinator.bugsReporterCoordinator ?? .init(parent: ReporterContainerCoordinator.init()))
        }
        }
        
    }
}

#Preview {
    ReporterContainerCoordinatorView(){
        
    }
}
