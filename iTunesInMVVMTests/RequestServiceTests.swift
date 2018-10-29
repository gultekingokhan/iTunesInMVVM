//
//  RequestServiceTests.swift
//  iTunesInMVVMTests
//
//  Created by Gokhan Gultekin on 29.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import iTunesInMVVM

class RequestServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testConcatenateURL() {
        
        let url = "https://itunes.apple.com/"
        let path = "search"
        guard let requestURL = URL(string: "\(url)\(path)") else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual(requestURL, URL(string: "https://itunes.apple.com/search"))
        XCTAssertNotEqual(requestURL, URL(string: "https://itunes.apple.comsearch"))
    }
}
