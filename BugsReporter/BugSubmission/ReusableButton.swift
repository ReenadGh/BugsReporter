//
//  ReusableButton.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import SwiftUI

struct ReusableButton: View {
    let title: String
    let backgroundColor: Color = Color(.systemBlue)
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .font(.title3)
                .foregroundColor(.white)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(12)
        }
    }
}
#Preview {
    ReusableButton(title: "title"){
        
    }
}
