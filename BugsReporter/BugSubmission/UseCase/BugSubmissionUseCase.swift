//
//  BugSubmissionUseCase.swift
//  BugsReporter
//
//  Created by Reenad gh on 05/04/2024.
//

import Foundation
import SwiftUI
import Moya
import Combine

class BugSubmissionUseCase {
    
    let googleSheetRepo: GoogleSheetRepositoryImplementation

    let sheetManager = SheetManager.shared
    
    init(googleSheetRepo: GoogleSheetRepositoryImplementation) {
        self.googleSheetRepo = googleSheetRepo
    }

    func appendNewBug(report: BugReport) -> AnyPublisher<Void, BugSubmissionError> {
        guard let spreadsheetId = sheetManager.sheetID else {
            return Fail(error: BugSubmissionError.noSheetAvalibale).eraseToAnyPublisher()
        }
        let range = SheetManager.shared.currentsheetTabRange

        return googleSheetRepo.appendBugReportToSheet(spreadsheetId:spreadsheetId , range: range, bugInfo: report)
            .mapError { moya in
                BugSubmissionError.backend
            }
            .eraseToAnyPublisher()
    }
    
    func addNewSheetTab() -> AnyPublisher<Void, BugSubmissionError> {
        guard let spreadsheetId = sheetManager.sheetID else {
            return Fail(error: BugSubmissionError.noSheetAvalibale).eraseToAnyPublisher()
        }
        return  googleSheetRepo.addNewSheetToSpreadsheet(title: sheetManager.currentsheetTab, spreadsheetId: spreadsheetId)

            .mapError { moya in
                BugSubmissionError.backend
            }
            .eraseToAnyPublisher()
    }
}

enum BugSubmissionError: Error {
    case backend
    case noSheetAvalibale
}
