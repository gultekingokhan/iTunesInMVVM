//
//  Box.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet { listener?(value) }
    }
    
    init(_ value: T) { self.value = value }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
