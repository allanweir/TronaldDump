//
//  TronaldCollectionViewController.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit
import SnapKit

class TronaldCollectionViewController: TronaldBaseViewController {

    fileprivate var refreshControl: UIRefreshControl?
    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var enableRefresh: Bool = true {
        didSet {
            self.updateRefreshControl()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        (self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing = 0
        (self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing = 0
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.updateRefreshControl()
    }
    
    // MARK: Refresh Functionality
    
    private func updateRefreshControl() {
        self.collectionView.alwaysBounceVertical = self.enableRefresh
        
        if self.enableRefresh && self.refreshControl == nil {
            self.refreshControl = UIRefreshControl()
            self.refreshControl?.addTarget(self, action: #selector(TronaldBaseViewController.refresh), for: .valueChanged)
            self.collectionView.addSubview(self.refreshControl!)
        } else if !self.enableRefresh {
            self.refreshControl?.removeFromSuperview()
            self.refreshControl = nil
        }
    }
    
    override func updateLoadingState() {
        UIView.animate(using: .short) {
            switch self.loadingState {
            case .loading: fallthrough
            case .refreshing:
                self.collectionView.alpha = 0.5
            default:
                self.collectionView.alpha = 1
                self.refreshControl?.endRefreshing()
            }
        }
    }

}

// UICollectionViewController Data
extension TronaldCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
}

// UICollectionViewController Delegate
extension TronaldCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        Log.error("Override this method")
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension TronaldCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
