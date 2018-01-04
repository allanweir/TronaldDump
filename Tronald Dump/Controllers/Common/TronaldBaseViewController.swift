//
//  TronaldBaseViewController.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

enum LoadingState {
    case ready
    case loading
    case refreshing
    case error(_: Error?)
}

// A base view controller which contains common functionality for data-driven view controllers
// The idea is to make it as simple as possible for subclasses to update their UI based on state changes related to data requests
class TronaldBaseViewController: UIViewController {

    var loadingState: LoadingState = .ready {
        didSet {
            self.updateLoadingState()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }

    func loadData(isRefreshing: Bool = false) {
        self.loadingState = isRefreshing ? .refreshing : .loading
    }
    
    @objc func refresh() {
        self.loadData(isRefreshing: false)
    }
    
    func updateLoadingState() {
        //Each view controller is responsible for updating it's loading state and responding visually to changes
    }
}
