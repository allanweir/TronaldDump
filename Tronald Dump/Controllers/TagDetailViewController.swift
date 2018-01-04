//
//  TagDetailViewController.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class TagDetailViewController: TronaldCollectionViewController {

    private let cellIdentifierTagDetailQuote = "TagDetailQuoteCell"
    
    private var dataAdapter = TagDetailDataAdapter()
    private let tagName: String
    
    private var scrollView = UIScrollView()
    
    required init(tagName: String) {
        self.tagName = tagName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.tagName = ""
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.tagName
        
        self.collectionView.register(QuoteCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifierTagDetailQuote)
        self.loadData()
    }
    
    override func loadData(isRefreshing: Bool = false) {
        super.loadData(isRefreshing: isRefreshing)
        
        self.dataAdapter.load(tagName: self.tagName) { [weak self] (success, error) in
            guard let strongSelf = self else {
                return
            }
            
            if !success && !strongSelf.dataAdapter.dataAvailable {
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
extension TagDetailViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataAdapter.numberOfQuotes
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierTagDetailQuote, for: indexPath) as? QuoteCollectionViewCell
        
        // Configure the cell
        if let quote = self.dataAdapter.quoteAt(index: indexPath.row) {
            cell?.setQuote(quote.value, date: quote.createdDate)
        }
        return cell!
    }
    
}

// MARK: UICollectionViewDelegate
extension TagDetailViewController {
    
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return false
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension TagDetailViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: TronaldStyles.UI.Cell.QuoteCell.height)
    }
}
