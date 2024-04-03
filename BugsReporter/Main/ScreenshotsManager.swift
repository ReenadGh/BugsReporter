//
//  ScreenshotsManager.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import Foundation
import UIKit
import SwiftUI

class ScreenshotManager {
    
    static let shared = ScreenshotManager()
    
    private init() {}
    
    func takeScreenshot(window: UIWindow?, completion: @escaping (Image?) -> Void) {
        DispatchQueue.main.async {
            UIGraphicsBeginImageContextWithOptions(window?.frame.size ?? CGSize(width: 300, height: 300), false, 0)
            window?.layer.render(in: UIGraphicsGetCurrentContext()!)
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                completion(Image(uiImage: image))
            }
        }
    }
}
