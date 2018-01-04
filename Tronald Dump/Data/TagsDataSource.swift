//
//  TagsDataSource.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class TagsDataSource: TronaldBaseDataSource<[String]> {

    override init() {
        
    }
    
    func load(completion: @escaping DataSourceCompletion) {
        TronaldDumpAPIService.sharedService.getTags { [weak self] (data, error) in
            self?.parse(data: data)
            completion(self?.data, error)
        }
    }
    
    func parse(data: [String: Any]?) {
        guard let tagsData = data, let tagsList = tagsData["_embedded"] as? [String] else {
            return
        }
        
        self.data = tagsList
    }
    
}
