//
//  SimpleTextCollectionViewCell.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class SimpleTextCollectionViewCell: TronaldBaseCollectionViewCell {
    
    private var textLabel = UILabel()
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
        self.contentView.addSubview(self.textLabel)
        self.textLabel.font = TronaldStyles.UI.Cell.SimpleTextCell.font
        self.textLabel.textColor = TronaldStyles.UI.Cell.SimpleTextCell.textColor
        self.textLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(TronaldStyles.UI.Cell.SimpleTextCell.horizontalPadding)
            make.right.equalToSuperview().offset(-TronaldStyles.UI.Cell.SimpleTextCell.horizontalPadding)
            make.centerY.equalToSuperview()
        }
        
        self.contentView.addSubview(self.topHairline)
        self.topHairline.backgroundColor = TronaldStyles.UI.Cell.SimpleTextCell.hairlineColor
        self.topHairline.snp.makeConstraints { (make) in
            make.left.equalTo(self.textLabel)
            make.right.equalTo(self.textLabel)
            make.height.equalTo(1)
            make.top.equalToSuperview().offset(-1)
        }
        
        self.contentView.addSubview(self.bottomHairline)
        self.bottomHairline.backgroundColor = TronaldStyles.UI.Cell.SimpleTextCell.hairlineColor
        self.bottomHairline.snp.makeConstraints { (make) in
            make.left.equalTo(self.textLabel)
            make.right.equalTo(self.textLabel)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
    
    func setLabel(_ label: String) {
        self.textLabel.text = label
    }
}
