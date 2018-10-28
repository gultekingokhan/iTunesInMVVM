//
//  iTunesService.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import Alamofire

struct APIService {
    
    func search(query: String) {
        
        Alamofire.request(requestUrl, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseData { (data) in
            
            guard let responseData = data.result.value else {
                failure(NSLocalizedString("Generic.ConnectionError", comment: ""))
                return
            }
            
            if let s = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                print("RESP: \(s)")
            }
            
            guard data.response?.statusCode == 200  else {
                let error: GRNTErrorModel = self.handleErrors(responseData: responseData)
                let logModel = GRNTErrorLogModel(url: "\(requestUrl)", body: params?.description, response: error.message)
                if shouldLogError == true {
                    GRNTErrorLogAPI.logError(model: logModel)
                }
                if error.status != 403 {
                    failure(error.message!)
                }
                return
            }
            success(responseData)
        }
    }
}
