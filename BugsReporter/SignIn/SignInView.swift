//
//  SignInView.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignInView: View {
        
    @ObservedObject var  viewModel: SignInViewModel 
    
    var body: some View {
        
        VStack(spacing: 20){
          
            AppLottieView(name: .flayingBug)
                .frame(width: 300, height: 300)
           
            HStack (spacing: 0){
                Rectangle()
                    .frame(width: 30 , height: 3)
                
                ForEach(SignInStep.allCases , id: \.self ) { step in
                    Text(step.flagTitle)
                        .bold()
                        .foregroundStyle(step == viewModel.step ? Color.white : Color.darkGreen)
                        .padding(10)
                        .background( step == viewModel.step ?  .darkGreen: Color.softGreen.opacity(0.2))
                        .cornerRadius(12)
                    Rectangle()
                        .frame(width: 30 , height: 3)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .cornerRadius(12)

            VStack{
               
                VStack{
                    Text(viewModel.step.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.darkGreen)
                    
                    
                    Text(viewModel.step.description)
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundStyle(.darkGreen.opacity(0.8))
                }
                
                TextField("Add Sheet Name", text: $viewModel.sheetName)
                    .padding()
                    .background(Color.softGreen.opacity(0.5))
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .isHidden(viewModel.step != .step2, remove: (viewModel.step != .step2))
                
                
            }
            .padding(.horizontal)
         
 
            ReusableButton(title: viewModel.step.buttonTitle) {
                viewModel.handleStepSignIn()
            }
            .frame(width: 300)
            .onAppear{
                viewModel.checkUserStepsStatus()
            }
        }
        
    }
}

#Preview {
    SignInView(viewModel: .init(coordinator: .init(parent: nil)))
}

enum SignInStep: CaseIterable {
    case step1
    case step2
    
    var flagTitle : String {
        switch self {
        case .step1:
            return "Step 1"
        case .step2:
            return "Step 2"
        }
    }
    
    

    var description: String {
        switch self {
        case .step1:
            return "Link your Google account to seamlessly create a bug tracking sheet. Streamline your bug management process with ease!"
        case .step2:
            return "Name your bug tracking sheet. A descriptive name helps organize and identify your projects efficiently."
        }
    }

    var title: String {
        switch self {
        case .step1:
            return "Link Your Google Account"
        case .step2:
            return "Name Your Bug Tracking Sheet"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .step1:
            return "Link Account"
        case .step2:
            return "Name & Create Sheet"
        }
    }
}
