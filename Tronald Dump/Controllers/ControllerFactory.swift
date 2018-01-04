//
//  ControllerFactory.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

enum ControllerType {
    case tagList
    case tagDetail(tagName: String)
}

class ControllerFactory {

    static func getController(forType type: ControllerType) -> UIViewController {
        switch type {
        case .tagList:
            return TagListCollectionViewController(nibName: nil, bundle: nil)
        case .tagDetail(let tagName):
            return TagDetailViewController(tagName: tagName)
        }
    }

}
