//
//  TronaldBaseCollectionViewCell.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

class TronaldBaseCollectionViewCell: UICollectionViewCell {
    
    enum CellState {
        case selected
        case highlighted
        case selectedAndHighlighted
        case unselected
    }
    
    fileprivate(set) var state: CellState = .unselected {
        didSet {
            self.stateUpdated()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.updateState()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.updateState()
        }
    }
    
    private func updateState() {
        if self.isSelected && self.isHighlighted {
            self.state = .selectedAndHighlighted
        } else if self.isSelected {
            self.state = .selected
        } else if self.isHighlighted {
            self.state = .highlighted
        } else {
            self.state = .unselected
        }
    }
    
    func stateUpdated() {
        UIView.animate(using: TronaldStyles.UI.Cell.BaseCell.highlightAnimation) {
            switch self.state {
            case .highlighted: fallthrough
            case .selectedAndHighlighted:
                self.contentView.backgroundColor = TronaldStyles.UI.Cell.BaseCell.backgroundColor.colorWith(.brightness, -, 0.05)
            default:
                self.contentView.backgroundColor = TronaldStyles.UI.Cell.BaseCell.backgroundColor
            }
        }
    }
    
}
