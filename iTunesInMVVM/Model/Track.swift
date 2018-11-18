//
//  Track.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation

struct TrackResponseModel: Decodable {

    let results: [Track]?
}

struct Track: Decodable {
    
    let artistName: String?
    let trackId: Int?
    let trackName: String?
    let artworkUrl100: String?
}
