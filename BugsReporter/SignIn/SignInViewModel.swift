//
//  SignInViewModel.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import SwiftUI
import GoogleSignIn
import Combine

class SignInViewModel: ObservableObject {
  
    unowned let coordinator: SignInCoordinator
    let googleSheetRepo: GoogleSheetRepositoryImplementation = .init()
    private var cancellables = Set<AnyCancellable>()
    
    
    @Published var step: SignInStep = .step1
    @Published var sheetName: String = ""
    @Published var alertMessage: String = ""

    
    init(coordinator: SignInCoordinator) {
        self.coordinator = coordinator
    }
    
    func handleStepSignIn(){
        switch step {
        case .step1:
            handleGoogleSignIn()
        case .step2:
            createNewSheet()
        }
    }
  
    private func handleGoogleSignIn() {
        AuthenticationManager.shared.signup { result in
            switch result {
            case .success(_):
                print("User Loggedin")
                self.checkUserStepsStatus()
            case .failure(let failure):
                self.showErrorAlert()
            }
        }
    }
    
    func showErrorAlert(){
        showAlert()
        alertMessage = Constants.GENERAL_ERROR_MESSAGE
    }
    
    private func createNewSheet(){
        googleSheetRepo.createNewSpreadsheet(title: sheetName)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    print("finished")
                case .failure(let error):
                    self.showErrorAlert()
                    print(error)
                }
            } receiveValue: {sheetId in
                print(sheetId)
                SheetManager.shared.addSheetID(sheetId)
                self.closeSignUpScreen()
            }
            .store(in: &cancellables)
    }
    
   
    func checkUserStepsStatus(){
        guard  AuthenticationManager.shared.isUserLoggedin else {
            return
        }
        withAnimation(.spring){
            step = .step2
        }
    }
    
   func closeSignUpScreen(){
        self.coordinator.parent?.showSignIn = false
    }
    
    func showAlert(){
        self.coordinator.showAlert = true
    }
}
