//
//  MainViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import UIKit
import SwiftUI
import GoogleSignIn
import Combine


class MainViewModel: ObservableObject {
   
   unowned private let coordinator: MainCoordinator
   

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator    
    }
    
     func openBugReporterScreen() {
         coordinator.openBugReporterScreen(with: .init())
    }
}
