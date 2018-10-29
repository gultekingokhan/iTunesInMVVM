//
//  TrackViewModelTests.swift
//  iTunesInMVVMTests
//
//  Created by Gokhan Gultekin on 29.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import iTunesInMVVM

class TrackViewModelTests: XCTestCase {

    var viewModel: TrackViewModel!
    var dataSource : GenericDataSource<Track>!
    fileprivate var service : MockTrackService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.service = MockTrackService()
        self.dataSource = GenericDataSource<Track>()
        self.viewModel = TrackViewModel(service: service, dataSource: dataSource)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testInit() {
        
        let dataSource = GenericDataSource<Track>()
        let viewModel = TrackViewModel(dataSource: dataSource)
        XCTAssertEqual(viewModel.dataSource, dataSource)
    }
    
    func testFetchWithNoService() {
        
        viewModel.service = nil
        
        viewModel.search(query: "metallica", success: { (response) in
            XCTAssert(false)
        }) { (error) in
            XCTAssert(true)
        }
    }
    
    func testFetchTracks() {
        
        viewModel.search(query: "metallica", success: { (response) in
            XCTAssert(true)
        }) { (error) in
            XCTAssert(false)
        }
    }
}

class MockTrackService: TrackServiceProtocol {
    
    var responseModel: TrackResponseModel?
    var error: ErrorModel?
    
    func search(query: String, success: @escaping (TrackResponseModel) -> Void, failure: @escaping (ErrorModel) -> Void) {
        
        if let responseModel = responseModel {
            success(responseModel)
        } else {
            failure(ErrorModel.other(string: "Couldn't fetch data."))
        }
    }
}
