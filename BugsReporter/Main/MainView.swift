//
//  ContentView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button{
            }label: {
                Text("bugSubmission")
            }
        }
        .padding()
    }
}

#Preview {
    MainView(viewModel: MainViewModel(coordinator: MainCoordinator()))
}
