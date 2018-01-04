//
//  TronaldBaseDataSource.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import Foundation

class TronaldBaseDataSource<T: Any> {
    
    typealias DataSourceCompletion = ((_ response: T?, _ error: Error?) -> Void)
    
    var error: Error?
    var data: T?
    
    init() {
        
    }
    
    func completeOperation(error: Error?) {
        self.error = error ?? self.error
        
    }
    
}

extension TronaldBaseDataSource {
    
    private func parse<U: Any>(from dataSource: [String: Any], key: String) -> U? {
        return dataSource[key] as? U
    }
    
    func parseString(from dataSource: [String: Any], key: String) -> String? {
        return self.parse(from: dataSource, key: key)
    }
    
    func parseInt(from dataSource: [String: Any], key: String) -> Int? {
        return self.parse(from: dataSource, key: key)
    }
    
    func parseDate(from dataSource: [String: Any], key: String) -> Date? {
        guard let dateString: String = self.parse(from: dataSource, key: key) else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        return dateFormatter.date(from: dateString)
    }
    
}
