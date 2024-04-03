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
        VStack(spacing: 20) {
 
            
            ZStack {
                if  viewModel.isImageUploaded {
                  
                        VStack(spacing : 20){
                          
                            viewModel.report.image?
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .frame(height: 300)
                                .padding(.horizontal, 50)
                        }
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6).cornerRadius(12))
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
                            .padding()
                        }
                        
                } else {
                    PhotosPickerDemo(image: $viewModel.report.image) {
                        VStack(spacing : 20){
                            
                            Image(systemName:  "icloud.and.arrow.up")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 60)
                            Label("Upload Image" , systemImage: "ladybug")
                        }
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6).cornerRadius(12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash:[10]))
                        )
                    }
                }
            }
            
            TextField("Description", text: $viewModel.report.description)
                .padding()
                .background(Color(.systemGray6))
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)

            
            ReusableButton(title: "Submit") {
                
            }
             
            
        }
        .frame(width: UIScreen.main.bounds.width - 40)
        .padding()
        .navigationTitle("Report A Bug")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    BugSubmissionView(viewModel: .init(coordinator: .init(parent: .init()), report: .init(image: Image(systemName: "xmark"), description: "")))
}
