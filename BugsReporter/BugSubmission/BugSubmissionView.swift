//
//  BugSubmissionView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI

struct BugSubmissionView: View {
  
    @ObservedObject var  viewModel: BugSubmissionViewModel

    init(viewModel: BugSubmissionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            viewModel.report?.image?
                .resizable()
                .foregroundStyle(.tint)
                .onTapGesture {
                    viewModel.openImagePreview()
                }
            Text("Hello, world!")
            
            Button{
                viewModel.backToMainScreen()
            }label: {
                Text("back")
            }
        }
        .padding()
    }
}

#Preview {
    BugSubmissionView(viewModel: .init(coordinator: .init(parent:.init())))
}
