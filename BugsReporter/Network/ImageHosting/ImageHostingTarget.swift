//
//  ImageHostingTarget.swift
//  BugsReporter
//
//  Created by Reenad gh on 05/04/2024.
//

import Foundation
import Moya


enum ImgBBService {
    case uploadImage(imageData: String)
}

extension ImgBBService: TargetType {
    
    var apiKey:String { "050eb74c11167cdf1f5356fb0bc15b22"
    }
    var baseURL: URL { URL(string: "https://api.imgbb.com")! }
     
     var path: String {
         switch self {
         case .uploadImage:
             return "/1/upload"
         }
     }
     
     var method: Moya.Method {
         return .post
     }
     
     var task: Task {
         switch self {
         case .uploadImage( let imageData):
             let parameters: [String: Any] = ["key": "f23a25bb9b8ab389e8acd316944ac313" , "image": imageData]
                         return .requestParameters(parameters: parameters, encoding: URLEncoding.httpBody)
         }
     }
     
     var headers: [String : String]? {
         return ["Content-Type": "multipart/form-data"]
     }
     
     var sampleData: Data {
         return Data()
     }
}
