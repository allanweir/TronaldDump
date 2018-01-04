//
//  TagListCollectionDataAdapter.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class TagListCollectionDataAdapter: TronaldBaseDataAdapter {

    fileprivate var dataSource = TagsDataSource()
    
    var tags: [String] {
        return self.dataSource.data ?? []
    }
    
    var tagsAvailable: Bool {
        return self.dataSource.error == nil && self.dataSource.data != nil
    }
    
    func load(completion: @escaping DataOperationCompletion) {
        self.dataSource.load { (tags, error) in
            completion(tags != nil, error)
        }
    }
    
    func tagNameAt(index: Int) -> String? {
        guard index >= 0 && index < self.tags.count else {
            return nil
        }
        
        return self.tags[index]
    }
}
