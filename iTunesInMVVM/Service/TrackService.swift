//
//  TrackService.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation

protocol TrackServiceProtocol {
    func search(query: String, success: @escaping(_ result: TrackResponseModel) -> Void, failure: @escaping(_ error: ErrorModel) -> Void)
}

class TrackService: NSObject, TrackServiceProtocol {
    
    static let shared = TrackService()
    //For API documentation: https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/SearchExamples.html#//apple_ref/doc/uid/TP40017632-CH6-SW1
    
    func search(query: String, success: @escaping(_ result: TrackResponseModel) -> Void, failure: @escaping(_ error: ErrorModel) -> Void) {

        NSObject.cancelPreviousPerformRequests(withTarget: self)
        
        RequestService.get(path: "search", params: ["term":query], headers: nil, success: { (data) in
            
            guard let response = try? JSONDecoder().decode(TrackResponseModel.self, from: data) else {
                failure(ErrorModel.parse(string: "Parsing error."))
                return
            }
            success(response)

        }, failure: { (error) in
            failure(error)
        })
    }
}
