//
//  ImageHostingRepo.swift
//  BugsReporter
//
//  Created by Reenad gh on 05/04/2024.
//

import Foundation
import Moya
import Combine

protocol ImageHostingRepository {
   func addImageUrl(imageData: Data) -> AnyPublisher<String,MoyaError>}

class ImageHostingRepositoryImplementation: ImageHostingRepository{
    
    private let provider: MoyaProvider<ImgBBService>
    
    init() {
        self.provider = MoyaProvider<ImgBBService>()
    }
    
    func addImageUrl(imageData: Data) -> AnyPublisher<String,MoyaError> {
        // Encode the image data as a Base64 string
        let base64ImageString = imageData.base64EncodedString()
        
        return provider
            .requestPublisher(.uploadImage(imageData: base64ImageString)) // Pass the Base64 string instead of raw Data
            .tryMap { response -> String in
                let jsonResponse = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any]
                print(jsonResponse)
                if let data = jsonResponse?["data"] as? [String: Any], let imageUrl = data["url"] as? String {
                    return imageUrl
                } else {
                    throw MoyaError.jsonMapping(response)
                }
            }
            .mapError { $0 as! MoyaError }
            .eraseToAnyPublisher()
    }
   }

