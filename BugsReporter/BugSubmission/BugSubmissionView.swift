//
//  BugSubmissionView.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI
import GoogleSignIn
struct BugSubmissionView: View {
  
    @ObservedObject var  viewModel: BugSubmissionViewModel

    init(viewModel: BugSubmissionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            ZStack {
                if  viewModel.isImageUploaded {
                  
                        VStack(spacing : 20){
                          
                            Image(uiImage: viewModel.report.image!)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .frame(height: 300)
                                .padding(.horizontal, 50)
                        }
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .background(Color.softGreen.opacity(0.3).cornerRadius(12))
                        .overlay (alignment: .top){
                            HStack {
                                Button{
                                    viewModel.deleteImage()
                                } label: {
                                    Image(systemName: "xmark.circle")
                                        .imageScale(.large)
                                }
                                Spacer()
                                Button{
                                    viewModel.openImagePreview()

                                } label: {
                                    Image(systemName: "plus.magnifyingglass")
                                        .imageScale(.large)
                                }
                            }
                            .foregroundColor(.darkGreen)
                            .padding()
                        }
                        
                } else {
                    AppPhotosPicker(image: $viewModel.report.image)
                }
            }
            
            TextField("Add Description Here", text: $viewModel.report.description)
                .padding()
                .background(.softGreen.opacity(0.3))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)

            
            ReusableButton(title: "Submit") {
                viewModel.submitNewBug()
            }
             
            
        }
        .frame(width: UIScreen.main.bounds.width - 40)
        .padding()
        .navigationTitle("Report A Bug")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    BugSubmissionView(viewModel: MockViewModel.bugSubmissionViewModel)
}
