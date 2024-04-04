//
//  GoogleSheetTarget.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import Moya

enum GoogleSheets {
    case createNewSpreadsheet(title: String)
    case addSheetTab(title: String, spreadsheetId: String)
}

extension GoogleSheets: TargetType {
    var baseURL: URL {
        return URL(string: "https://sheets.googleapis.com/v4")!
    }
    
    var path: String {
        switch self {
        case .createNewSpreadsheet:
            return "/spreadsheets"
        case .addSheetTab(_, let spreadsheetId):
                   return "/spreadsheets/\(spreadsheetId):batchUpdate"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createNewSpreadsheet , .addSheetTab:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .createNewSpreadsheet(let title):
            let jsonBody: [String: Any] = [
                "properties": [
                    "title": title
                ]
            ]
            return .requestParameters(parameters: jsonBody, encoding: JSONEncoding.default)
            
        case .addSheetTab(let title,_):
            let jsonBody: [String: Any] = [
                     "requests": [[
                         "addSheet": [
                             "properties": ["title": title]
                         ]
                     ]]
                 ]
                 return .requestParameters(parameters: jsonBody, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
            return [
                "Content-Type": "application/json"
            ]
    }
    
    // Sample Data for testing
    var sampleData: Data {
        return Data()
    }
}
