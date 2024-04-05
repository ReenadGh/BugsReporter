//
//  AuthinticationManager.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import GoogleSignIn
import SwiftUI

class AuthenticationManager {
    // Singleton instance
    static let shared = AuthenticationManager()
    
    private let scopes = ["https://www.googleapis.com/auth/spreadsheets"]
    
    
    private init() {} // Private initialization to ensure Singleton instance
    
    var isUserLoggedin: Bool {
        return GIDSignIn.sharedInstance.currentUser != nil
    }
    var accessToken: String? {
        return GIDSignIn.sharedInstance.currentUser?.accessToken.tokenString
    }
    
    // Function to restore previous Google Sign-In
    func fetchUserAccess(completion: @escaping ((Result<GIDGoogleUser, Error>) -> Void)){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                completion(.failure(error))
                
            } else if let user = user {
                completion(.success(user))
            }
        }
    }
    func signup(completion: @escaping ((Result<String?, Error>) -> Void)){
        
        GIDSignIn.sharedInstance.signIn(withPresenting: UIApplication.getRootViewController() , hint: nil, additionalScopes: scopes) { signInResult, error in
           
            if let error {
                completion(.failure(error))
            }
            completion( .success(signInResult?.user.profile?.name))

            // If sign in succeeded, display the app's main
        }
    }
}

