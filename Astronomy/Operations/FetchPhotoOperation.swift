//
//  FetchPhotoOperation.swift
//  Astronomy
//
//  Created by Jonathan T. Miles on 9/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class FetchPhotoOperation : ConcurrentOperation {
    
    init(reference: MarsPhotoReference) {
        self.reference = reference
    }
    
    let reference: MarsPhotoReference
    var imageData: Data?
    private var dataTask: URLSessionDataTask?
    
    override func start() {
        state = .isExecuting
        
        dataTask = URLSession.shared.dataTask(with: reference.imageURL) { (data, _, error) in
            if let error = error {
                NSLog("error fetching with datatask: \(error)")
                return
            }
            if let data = data {
                self.imageData = data
            }
        }
        dataTask?.resume()
    }
}
