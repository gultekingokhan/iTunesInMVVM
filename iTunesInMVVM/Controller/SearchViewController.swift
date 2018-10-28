//
//  SearchViewController.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = TrackDataSource()
    var viewModel: TrackViewModel {
        return TrackViewModel(dataSource: dataSource)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        
        let nib = UINib(nibName: "TrackTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TrackTableViewCell")
        
        self.dataSource.data.bind { (results) in
            self.tableView.reloadData()
        }
        viewModel.search(query: "metallica")
    }
}
