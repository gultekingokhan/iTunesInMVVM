//
//  Networking.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import Alamofire

struct RequestService {
    
    static func get(path: String, params: [String: Any]?, headers: [String: String]?, success: @escaping (Data) -> Void, failure: @escaping (ErrorModel) -> Void) {
        
        guard let requestURL = URL(string: "\(Constants.iTunes.baseURL)\(path)") else {
            failure(ErrorModel.other(string: "URL encoding error."))
            return
        }
                
        Alamofire.request(requestURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseData { (data) in
            
            guard let responseData = data.result.value else {
                failure(ErrorModel.parse(string: "Data parse error."))
                return
            }
            
            guard data.response?.statusCode == 200  else {
                failure(ErrorModel.network(string: "Connection error."))
                return
            }
            success(responseData)
        }
    }
}
