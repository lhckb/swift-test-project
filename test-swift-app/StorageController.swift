//
//  StorageController.swift
//  test-swift-app
//
//  Created by Luís Cruz on 23/03/23.
//

import Foundation

public class StorageController {
    static let defaults = UserDefaults.standard
    
    static func setCounterValue(count: Int) {
        defaults.set(count, forKey: "count")
        defaults.synchronize()
    }
    
    static func getCounterValue() -> Int {
        defaults.synchronize()
        return defaults.integer(forKey: "count")
    }
}
