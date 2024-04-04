//
//  UIApplication+Extention.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import UIKit
extension UIApplication {
     static func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
