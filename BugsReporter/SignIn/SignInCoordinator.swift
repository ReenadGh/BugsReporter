//
//  SignInCoordinator.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation



public class SignInCoordinator: ObservableObject {
  
    unowned let parent: BugsReporterCoordinator?
 
    @Published var showAlert: Bool = false
    @Published var viewModel: SignInViewModel!
  

    init(parent: BugsReporterCoordinator?) {
        self.parent = parent
        self.viewModel = .init(coordinator: self)
    }

}
