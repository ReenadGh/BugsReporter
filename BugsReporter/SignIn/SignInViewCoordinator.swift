//
//  SignInViewCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import SwiftUI

struct SignInViewCoordinator: View {
    @StateObject var coordinator: SignInCoordinator
   
    var body: some View {
        SignInView(viewModel: coordinator.viewModel)
        
            .alert(isPresented: $coordinator.viewModel.showAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text(coordinator.viewModel.alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
    }
}

#Preview {
    SignInViewCoordinator(coordinator: .init(parent: nil))
}
