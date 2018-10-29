//
//  TrackDataSourceTests.swift
//  iTunesInMVVMTests
//
//  Created by Gokhan Gultekin on 29.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import iTunesInMVVM

class TrackDataSourceTests: XCTestCase {

    let track1 = Track(artistName: "Metallica", trackId: "579373079", trackName: "Enter Sandman", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/0b/9c/d2/0b9cd2e7-6e76-8912-0357-14780cc2616a/source/100x100bb.jpg")
    let track2 = Track(artistName: "Metallica", trackId: "579373086", trackName: "Nothing Else Matters", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music/v4/0b/9c/d2/0b9cd2e7-6e76-8912-0357-14780cc2616a/source/100x100bb.jpg")

    var dataSource: TrackDataSource!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataSource = TrackDataSource()
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

    func testEmptyValueInDataSource() {
        
        dataSource.data.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
    }
    
    func testValueInDataSource() {
        
        dataSource.data.value = [track1, track2]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testValueCell() {
        
        dataSource.data.value = [track1, track2]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource

        let nib = UINib(nibName: "TrackTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TrackTableViewCell")

        let indexPath = IndexPath(row: 0, section: 0)
        
        guard let cell = dataSource.tableView(tableView, cellForRowAt: indexPath) as? TrackTableViewCell else {
            XCTAssert(false)
            return
        }
        XCTAssertEqual(cell.trackNameLabel.text, "Enter Sandman")
    }
}
