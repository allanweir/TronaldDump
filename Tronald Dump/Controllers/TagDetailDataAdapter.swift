//
//  TagDetailDataAdapter.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class TagDetailDataAdapter: TronaldBaseDataAdapter {

    fileprivate var dataSource = TagDataSource()
    
    private var quotes: [TrumpQuote] {
        return self.dataSource.data ?? []
    }
    
    var numberOfQuotes: Int {
        return self.quotes.count
    }
    
    var dataAvailable: Bool {
        return self.dataSource.error == nil && self.dataSource.data != nil
    }
    
    func load(tagName: String, completion: @escaping DataOperationCompletion) {
        self.dataSource.load(tagName: tagName) { (data, error) in
            completion(data != nil, error)
        }
    }
    
    func quoteAt(index: Int) -> TrumpQuote? {
        guard index >= 0 && index < self.quotes.count else {
            return nil
        }
        
        return self.quotes[index]
    }
    
}
