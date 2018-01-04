//
//  QuoteCollectionViewCell.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class QuoteCollectionViewCell: TronaldBaseCollectionViewCell {
    
    private(set) var quoteLabel = UILabel()
    private(set) var dateLabel = UILabel()
    private(set) var topHairline = UIView()
    private(set) var bottomHairline = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.style()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.style()
    }
    
    private func style() {
        self.contentView.addSubview(self.quoteLabel)
        self.quoteLabel.font = TronaldStyles.UI.Cell.QuoteCell.quoteFont
        self.quoteLabel.textColor = TronaldStyles.UI.Cell.QuoteCell.quoteTextColor
        self.quoteLabel.numberOfLines = 4
        self.quoteLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(TronaldStyles.UI.Cell.QuoteCell.horizontalPadding)
            make.right.equalToSuperview().offset(-TronaldStyles.UI.Cell.QuoteCell.horizontalPadding)
            make.centerY.equalToSuperview()
        }
        
        self.contentView.addSubview(self.dateLabel)
        self.dateLabel.font = TronaldStyles.UI.Cell.QuoteCell.dateFont
        self.dateLabel.textColor = TronaldStyles.UI.Cell.QuoteCell.dateTextColor
        self.dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.quoteLabel)
            make.right.equalTo(self.quoteLabel)
            make.top.equalTo(self.quoteLabel.snp.bottom).offset(10)
        }
        
        self.contentView.addSubview(self.topHairline)
        self.topHairline.backgroundColor = TronaldStyles.UI.Cell.QuoteCell.hairlineColor
        self.topHairline.snp.makeConstraints { (make) in
            make.left.equalTo(self.quoteLabel)
            make.right.equalTo(self.quoteLabel)
            make.height.equalTo(1)
            make.top.equalToSuperview().offset(-1)
        }
        
        self.contentView.addSubview(self.bottomHairline)
        self.bottomHairline.backgroundColor = TronaldStyles.UI.Cell.QuoteCell.hairlineColor
        self.bottomHairline.snp.makeConstraints { (make) in
            make.left.equalTo(self.quoteLabel)
            make.right.equalTo(self.quoteLabel)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
    
    func setQuote(_ quote: String, date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm yyyy-MM-dd"
        
        self.quoteLabel.text = "\"\(quote)\""
        self.dateLabel.text = dateFormatter.string(from: date)
    }
}
