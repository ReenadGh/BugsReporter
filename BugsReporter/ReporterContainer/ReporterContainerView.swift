//
//  ReporterContainerView.swift
//  BugsReporter
//
//  Created by Reenad gh on 03/04/2024.
//

import SwiftUI

struct ReporterContainerView<Content: View>: View {
        
    let content: Content
    
    @ObservedObject var viewModel: ReporterContainerViewModel
    
    init(viewModel: ReporterContainerViewModel , @ViewBuilder content: () -> Content) {
         self.content = content()
        self.viewModel = viewModel
     }
    
    var body: some View {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(viewModel.backgroundColor)
                .overlay(alignment:.bottomLeading){
                    Button{
                        viewModel.takeScreenshotAndNavigate()
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
                    .isHidden(viewModel.isFlagHidden, remove: viewModel.isFlagHidden)
                }
    }
}

#Preview {
    ReporterContainerView (viewModel: .init(coordinator: .init())){
        Text("Test")
    }
}
