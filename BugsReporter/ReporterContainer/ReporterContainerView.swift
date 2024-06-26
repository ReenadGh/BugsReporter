//
//  ReporterContainerView.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import SwiftUI

struct ReporterContainerView<Content: View>: View {
        
    let content: Content
    
    @ObservedObject var coordinator = ReporterContainerCoordinator()
    init(@ViewBuilder content: () -> Content) {
         self.content = content()
     }
    
    var body: some View {
        NavigationStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(coordinator.viewModel.isCapturing ? .red : .white)
                .overlay(alignment:.bottomLeading){
                    Button{
                        coordinator.viewModel.takeScreenshotAndNavigate()
                    }label: {
                        Image(systemName: "ladybug")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: UIScreen.main.bounds.width/6)
                            .background(Color.darkGreen)
                            .clipShape(RoundedCorner(radius: 10, corners: [.topRight, .bottomRight]))
                            .shadow(color: .black.opacity(0.3), radius: 6)
                    }
                    .padding(.bottom , 40)
                }
            
     
                .navigationDestination(isPresented: $coordinator.isBugReporterShown) {
                    BugsReporterCoordinatorView(coordinator: coordinator.bugsReporterCoordinator ?? .init(parent: .init()))
                }
        }
    }
}

#Preview {
    ReporterContainerView{Text("Hi")}
}
