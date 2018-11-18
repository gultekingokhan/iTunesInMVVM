//
//  iTunesInMVVMTests.swift
//  iTunesInMVVMTests
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import iTunesInMVVM

class iTunesInMVVMTests: XCTestCase {

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

    func testDecodeFromEmptyData() {
        guard let _ = FileManager.readJson(forResource: "saple") else {
            XCTAssert(true)
            return
        }
        XCTAssert(false)
    }
    
    func testDecodeIntoResponseModel() {
        
        guard let data = FileManager.readJson(forResource: "sample") else {
            XCTAssert(false)
            return
        }
        
        let response = try? JSONDecoder().decode(TrackResponseModel.self, from: data)
        XCTAssertEqual(response?.results?.first?.trackId, 579373079)
        XCTAssertEqual(response?.results?.first?.trackName, "Enter Sandman")
        XCTAssertEqual(response?.results?.first?.artistName, "Metallica")
        XCTAssertEqual(response?.results?.first?.artworkUrl100, "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/0b/9c/d2/0b9cd2e7-6e76-8912-0357-14780cc2616a/source/100x100bb.jpg")

    }
}

extension FileManager {
    
    static func readJson(forResource fileName: String ) -> Data? {
        
        let bundle = Bundle(for: iTunesInMVVMTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        return nil
    }
}

