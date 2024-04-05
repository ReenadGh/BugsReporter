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
    var currentsheetTab: String {
        
        if currentSheetTab == nil {
            createNewSheetTabName()
        }
        return currentSheetTab ?? ""
    }
    var currentsheetTabRange: String {
        return currentSheetTab ?? "" + ":A1"
    }
    
    func addSheetID(_ id: String) {
        currentSheetKey = id
    }
    
    func createNewSheetTabName(){
        currentSheetTab = Date().convertDate(.formattedType1)
    }
    
    func isSheetTabExpired()-> Bool{
        return currentSheetTab != Date().convertDate(.formattedType1)
    }
}
