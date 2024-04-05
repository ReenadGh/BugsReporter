//
//  AppColors.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import SwiftUI

enum AppColors {
  
    case softGreen
    case darkGreen
    
    var color: Color {
        switch self {
        case .softGreen:
            return Color("softGreen")
        case .darkGreen:
            return  Color("darkGreen")
        }
    }
}
