//
//  BugsReporterApp.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import SwiftUI
import GoogleSignIn


@main
struct BugsReporterApp: App {
    
    var body: some Scene {
        WindowGroup {
            
            MainCoordinatorView(coordinator: .init())
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
            }
        }
    }


class AppDelegate: UIResponder, UIApplicationDelegate {
        
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        var handled: Bool

          handled = GIDSignIn.sharedInstance.handle(url)
          if handled {
            return true
          }

          // Handle other custom URL types.

          // If not handled by this app, return false.
          return false
    }
}
