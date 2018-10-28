//
//  ErrorModel.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 28.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation

enum ErrorModel: Error {
    case network(string: String)
    case parse(string: String)
    case other(string: String)
}
