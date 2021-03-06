//
//  TrackViewModel.swift
//  iTunesInMVVM
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import UIKit

struct TrackViewModel {

    weak var dataSource: GenericDataSource<Track>?
    var service: TrackServiceProtocol?
    
    init(service: TrackServiceProtocol = TrackService.shared, dataSource: GenericDataSource<Track>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func search(query: String,
                success: ((_ result: TrackResponseModel) -> Void)? = nil,
                failure: ((_ error: ErrorModel) -> Void)? = nil) {

        service?.search(query: query, success: { (data) in
            
            DispatchQueue.main.async {
                if let results = data.results {
                    self.dataSource?.data.value = results
                } else {
                    print("Error occured while assigning parsed data.")
                }
            }

        }, failure: { (error) in
            self.showAlertView(message: error.localizedDescription)
        })
    }
    
    func showAlertView(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: { (aa) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(doneAction)
    }
}

