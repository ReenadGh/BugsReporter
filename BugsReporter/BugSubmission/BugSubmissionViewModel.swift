//
//  BugSubmissionViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 02/04/2024.
//

import Foundation
import SwiftUI
import Combine
import Moya

class BugSubmissionViewModel: ObservableObject{
    
    unowned let coordinator: BugSubmissionCoordinator
   
    let useCase : BugSubmissionUseCase = .init(googleSheetRepo: .init())
    let imageHosting =  ImageHostingRepositoryImplementation()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var report: BugReport
    
    init(coordinator: BugSubmissionCoordinator, report: BugReport) {
        self.coordinator = coordinator
        self.report = report
    }
    var isImageUploaded: Bool {
        return report.image != nil
    }
    
    @MainActor func backToMainScreen(){
    }
    
    @MainActor func openImagePreview(){
            if let image = report.image {
                coordinator.openImagePreview(for: Image(uiImage: image))
            }
    }
    func deleteImage() {
        report.image = nil
    }
    
     func submitNewBug(){
       if  SheetManager.shared.isSheetTabExpired(){
           SheetManager.shared.createNewSheetTabName()
           createNewSheetThenAppendBug()
       } else {
           appendNewBug()
       }
    }
    
    func uploadImage(){
        
        guard let imageData = report.image?.jpegData(compressionQuality: 1.0) else {
            return
        } // or uiImage.pngData() for PNG data
        
        imageHosting.addImageUrl(imageData: imageData)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { url in
                print(url)
            }
            .store(in: &cancellables)
    }
    
    private func appendNewBug(){
        useCase.appendNewBug(report: report)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    DispatchQueue.main.async { // Explicitly using main queue for safety
                        self.backToMainScreen()
                    }
                case .failure(let error):
                    print(error)
                }
            } receiveValue: {_ in
            }
            .store(in: &cancellables)
    }
    
    
    private func createNewSheetThenAppendBug(){
        
        useCase.addNewSheetTab()
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    self.appendNewBug()
                case .failure(let error):
                    print(error)
                }
            } receiveValue: {sheetId in
                print(sheetId)
            }
            .store(in: &cancellables)
    }
}


