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
                .overlay(alignment:.bottomLeading){
                    Button{
                        
                        coordinator.viewModel.takeScreenShoot { image in
                            coordinator.viewModel.openBugSubmissionView(image: image)
                        }
                    }label: {
                        Image(systemName: "ladybug")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: UIScreen.main.bounds.width/6)
                            .background(Color.red)
                            .clipShape(RoundedCorner(radius: 10, corners: [.topRight, .bottomRight]))
                        
                            .shadow(color: .black.opacity(0.3), radius: 6)
                    }
                    .padding(.bottom , 40)
                }
            
                .navigation(item: $coordinator.bugSubmissionCoordinator) { coordinator in
                    BugSubmissionCoordinatorView(coordinator: coordinator)
                }
        }
    }
}

#Preview {
    ReporterContainerView{Text("Hi")}
}


struct ScreenBug: Hashable {
   
    let image: Image?
    let description: String?
    
    static func == (lhs: ScreenBug, rhs: ScreenBug) -> Bool {
        // Assuming `description` is unique enough for equality checks.
        // Adjust according to your needs.
        return lhs.description == rhs.description
    }

    func hash(into hasher: inout Hasher) {
        // Hash only the `description` because `Image` is not Hashable.
        hasher.combine(description)
    }
}
