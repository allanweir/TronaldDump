//
//  TagDataSource.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class TagDataSource: TronaldBaseDataSource<[TrumpQuote]> {
    
    private enum RemoteDataProperty: String {
        case appearedAt = "appeared_at"
        case createdAt = "created_at"
        case quoteSourceId = "_embedded.source.quote_source_id"
        case value
    }
    
    override init() {
        
    }
    
    func load(tagName: String, completion: @escaping DataSourceCompletion) {
        TronaldDumpAPIService.sharedService.getTag(tagName) { [weak self] (data, error) in
            self?.parse(data: data)
            completion(self?.data, error)
        }
    }
    
    func parse(data: [String: Any]?) {
        guard let tagData = data, let embedded = tagData["_embedded"] as? [String: Any], let quoteList = embedded["tags"] as? [[String: Any]] else {
            return
        }
        
        self.data = []
        for quote in quoteList {
            Log.info(quote)
            
            if let value = self.parseString(from: quote, key: RemoteDataProperty.value.rawValue),
                let createdDate = self.parseDate(from: quote, key: RemoteDataProperty.createdAt.rawValue) {
                
                let quote = TrumpQuote(quoteID: "inconsistent", value: value, createdDate: createdDate)
                self.data?.append(quote)
            }
        }
    }
    
}
