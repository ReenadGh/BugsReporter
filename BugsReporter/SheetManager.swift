//
//  SheetManager.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import SwiftUI

class SheetManager {
    // Singleton instance
    static let shared = SheetManager()
  
    @AppStorage("sheetKey") private var currentSheetKey: String?
    @AppStorage("sheetTab") private var currentSheetTab: String?

    private init() {}
    
    var isSheetAvailable: Bool {
        return currentSheetKey != nil
    }
    var sheetID: String? {
        return currentSheetKey
    }
    
    func addSheetID(_ id: String) {
        currentSheetKey = id
    }
    
    func isSheetTabExpired()-> Bool{
        let sheetTab = "20-12-24"
    }
}
