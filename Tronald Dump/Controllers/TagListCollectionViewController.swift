//
//  TagListCollectionViewController.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class TagListCollectionViewController: TronaldCollectionViewController {
    
    private let cellIdentifierTagList = "TagListCell"
    var dataAdapter = TagListCollectionDataAdapter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Tronald Dump Tags"

        self.collectionView.register(SimpleTextCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifierTagList)
        self.loadData()
    }
    
    override func loadData(isRefreshing: Bool = false) {
        super.loadData(isRefreshing: isRefreshing)
        
        self.dataAdapter.load { [weak self] (success, error) in
            guard let strongSelf = self else {
                return
            }
            
            if !success && !strongSelf.dataAdapter.tagsAvailable {
                strongSelf.loadingState = .error(error)
            } else {
                strongSelf.didLoadData()
            }
        }
    }
    
    private func didLoadData() {
        self.collectionView.reloadData()
        self.loadingState = .ready
    }
}

// MARK: UICollectionViewDataSource
extension TagListCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataAdapter.tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierTagList, for: indexPath) as? SimpleTextCollectionViewCell
    
        // Configure the cell
        let tag = self.dataAdapter.tagNameAt(index: indexPath.row) ?? ""
        cell?.setLabel(tag)
        return cell!
    }

}

// MARK: UICollectionVIewDelegate
extension TagListCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tagName = self.dataAdapter.tagNameAt(index: indexPath.row) else {
            return
        }
        let controller = ControllerFactory.getController(forType: .tagDetail(tagName: tagName))
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension TagListCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: TronaldStyles.UI.Cell.SimpleTextCell.height)
    }
}
