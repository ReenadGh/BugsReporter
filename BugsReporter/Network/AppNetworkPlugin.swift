//
//  AppNetworkPlugin.swift
//  BugsReporter
//
//  Created by Reenad gh on 04/04/2024.
//

import Foundation
import Moya

struct GoogleAccessTokenPlugin: PluginType {
   
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        if let accessToken = GIDSignIn.sharedInstance.currentUser?.accessToken.tokenString {
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
}
