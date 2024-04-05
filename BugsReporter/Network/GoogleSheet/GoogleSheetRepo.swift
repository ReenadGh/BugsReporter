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
    func addNewSheetToSpreadsheet(title: String, spreadsheetId: String) -> AnyPublisher<Void, MoyaError>
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
                let jsonResponse = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
                if let spreadsheetId = jsonResponse?["spreadsheetId"] as? String {
                    return spreadsheetId
                } else {
                    throw MoyaError.jsonMapping(response)
                }
            }
            .mapError { $0 as! MoyaError }
            .eraseToAnyPublisher()
    }
    
    func addNewSheetToSpreadsheet(title: String, spreadsheetId: String) -> AnyPublisher<Void, MoyaError> {
         return provider
            .requestPublisher(.addSheetTab(title: title, spreadsheetId: spreadsheetId))
             .tryMap { response -> Void in
                 guard response.statusCode == 200 else {
                     throw MoyaError.statusCode(response)
                 }
             }
             .mapError { $0 as! MoyaError }
             .eraseToAnyPublisher()
     }
    
    func appendBugReportToSheet(spreadsheetId: String, range: String, bugInfo: BugReport) -> AnyPublisher<Void, MoyaError> {
        
        let values =  [[bugInfo.description, bugInfo.imgageUrl]]
           return provider
               .requestPublisher(.appendRow(spreadsheetId: spreadsheetId, range: range, values: values))
               .tryMap { response -> Void in
                   guard response.statusCode == 200 else {
                       throw MoyaError.statusCode(response)
                   }
               }
               .mapError { $0 as! MoyaError }
               .eraseToAnyPublisher()
       }
   }

