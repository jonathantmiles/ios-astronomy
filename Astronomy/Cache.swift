//
//  Cache.swift
//  Astronomy
//
//  Created by Jonathan T. Miles on 9/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key, Value> where Key: Hashable {
    
    func cache(value: Value, for key: Key) {
        queue.async {
            self.storage[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
        return queue.sync {
            storage[key]
        }
    }
    
    private let queue = DispatchQueue(label: "CacheRestrictiveQueue")
    
    private var storage: [Key: Value] = [:]
}
