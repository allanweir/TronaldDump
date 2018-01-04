//
//  TronaldStyles.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//
// swiftlint:disable nesting
// swiftlint:disable type_name
//

import UIKit

struct TronaldStyles {
        
    struct Color {
        static let white = UIColor(rgb: 0xFFFFFF)
        static let black = UIColor(rgb: 0x000000)
        static let hairline = UIColor(rgb: 0xDDDDDD)
    }

    struct UI {
        
        struct Cell {
            
            struct BaseCell {
                static let backgroundColor = Color.white
                static let highlightAnimation = Animation.shortest
            }
            
            struct SimpleTextCell {
                static let textColor = Color.black
                static let hairlineColor = Color.hairline
                
                static let font = UIFont.systemFont(ofSize: 16)
                static let height: CGFloat = 60
                static let horizontalPadding: CGFloat = 20
            }
            
            struct QuoteCell {
                static let quoteTextColor = Color.black
                static let quoteFont = UIFont.italicSystemFont(ofSize: 18)
                
                static let dateTextColor = Color.black.colorWith(.brightness, -, 0.1)
                static let dateFont = UIFont.systemFont(ofSize: 12)
                
                static let hairlineColor = Color.hairline
                
                static let height: CGFloat = 160
                static let horizontalPadding: CGFloat = 20
            }
        }
    }
    
}
