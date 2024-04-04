//
//  googlesheetApi.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import Moya
import Combine
import GoogleSignIn

protocol GoogleSheetRepository {
    func createNewSpreadsheet(title: String) -> AnyPublisher<String, MoyaError>
}

class GoogleSheetRepositoryImplementation: GoogleSheetRepository {

    private let provider: MoyaProvider<GoogleSheets>
    
    init() {
        self.provider = MoyaProvider<GoogleSheets>(plugins: [GoogleAccessTokenPlugin()])
    }
    
    func createNewSpreadsheet(title: String) -> AnyPublisher<String, MoyaError> {
        return provider
            .requestPublisher(.createNewSpreadsheet(title: title))
            .tryMap { response -> String in
                // Attempt to parse the response data to JSON and extract the `spreadsheetId`
                let jsonResponse = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
                if let spreadsheetId = jsonResponse?["spreadsheetId"] as? String {
                    return spreadsheetId
                } else {
                    throw MoyaError.jsonMapping(response)
                }
            }
            .mapError { $0 as! MoyaError } // Cast errors to MoyaError
            .eraseToAnyPublisher()
    }
}

struct GoogleAccessTokenPlugin: PluginType {
   
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        if let accessToken = GIDSignIn.sharedInstance.currentUser?.accessToken.tokenString {
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
}
