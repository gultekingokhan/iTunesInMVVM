//
//  TrackDataSource.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 28.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: Box<[T]> = Box([])
}

class TrackDataSource: GenericDataSource<Track>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackTableViewCell", for: indexPath) as! TrackTableViewCell
        
        let track: Track = data.value[indexPath.row]
        cell.load(data: track)
        
        return cell
    }
}
