//
//  ImagePreviewView.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import SwiftUI

struct ImagePreviewView: View {
    
    @ObservedObject var coordinator: ImagePreviewCoordinator

    var body: some View {
        coordinator.image
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .background(Color.softGreen)
            .navigationTitle("Image Preview")
                     .toolbar {
                         if coordinator.parent?.parent != nil {
                             ToolbarItem(placement: .navigationBarTrailing) {
                                 Button("Cancel") {
                                     coordinator.backToMainScreen()
                                 }
                             }
                         }
                     }
    }
}

#Preview {
    ImagePreviewView(coordinator: .init(parent: nil, image: Image(systemName: "ladybug")))
}
