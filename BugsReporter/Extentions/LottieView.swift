//
//  LottieView.swift
//  Pods
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import Lottie
import SwiftUI


enum LottieName: String{
    case flayingBug = "flayingBug"
    case sheet = "sheet"

}

struct AppLottieView: View {
    let name:LottieName
    var body: some View {
        LottieView(animation: .named(name.rawValue))
            .looping()
    }
}
