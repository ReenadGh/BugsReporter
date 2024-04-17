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
        ScrollView {
            Text("*screen example*")
            
            ReusableButton(title: "+ New Ticket") {
            
                viewModel.openBugReporterScreen()
            }
            .padding(.horizontal , 30)
                .foregroundStyle(.darkGreen)

               VStack(alignment: .leading) {
                   Text("The Great Adventure of Bitsy the Bug")
                       .font(.title)
                       .fontWeight(.bold)
                       .padding(.bottom, 10)
                   
                   // Here, add your story text in segments.
                   Text("In a cozy corner of the vast digital universe, there was a vibrant world called CodeLand...")
                       .padding(.bottom, 10)
                   
                   // Assuming you have an image named "bugSystemImage" in your assets
                   HStack {
                       // Here, add your story text in segments.
                       Text("In a cozy ")
                        .padding(.bottom, 10)
                       
                       Image(systemName: "ladybug")
                           .resizable()
                           .scaledToFit()
                           .frame(width: 30)
                           .aspectRatio(contentMode: .fit)
                       .padding(.bottom, 10)
                       
                       Text("Bitsy, known for that ")
                           .padding(.bottom, 10)

                   }
                   
                   // Continue the story after the image
                   Text("Bitsy, known for her adventurous spirit, decided that she would explore the legendary system...")
                       .padding(.bottom, 10)
                   
                   // Conclude your story
                   Text("Inspired by what she saw, Bitsy realized that every bug, no matter how small, had a role to play...")
               }
               .padding()
           }
       }
    }

#Preview {
    MainView(viewModel: MockViewModel.mainViewModel)
}
