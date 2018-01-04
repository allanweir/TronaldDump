//
//  UIColorExtension.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

extension UIColor {

    //A typealias for a math operator in swift, pass +, -, *, / etc. as an argument as they have this method signature
    typealias ColorMathOperator = ((CGFloat, CGFloat) -> CGFloat)
    
    enum ColorProperty {
        case saturation
        case brightness
        case hue
        case alpha
    }
    
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255,
            blue: CGFloat(rgb & 0x0000FF) / 255,
            alpha: 1
        )
    }
    
    // MARK: - Modifiers
    
    /**
     A method for creating a new color with a single property modified from the original color
     Example: UIColor.blue.newColorWith(.brightness, -, 0.1)
     
     @param property - The color property to update
     @param modifier - A math function (+, -, *, /)
     @param value - The value to apply against the original color property value
     */
    func colorWith(_ property: ColorProperty, _ modifier: ColorMathOperator, _ value: CGFloat) -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            switch property {
            case .hue:
                return UIColor(hue: modifier(h, value), saturation: s, brightness: b, alpha: a)
            case .saturation:
                return UIColor(hue: h, saturation: modifier(s, value), brightness: b, alpha: a)
            case .brightness:
                return UIColor(hue: h, saturation: s, brightness: modifier(b, value), alpha: a)
            case .alpha:
                return UIColor(hue: h, saturation: s, brightness: b, alpha: modifier(a, value))
            }
        }
        return self
    }
    
    // MARK: - Generate image from color
    
    func imageFromColor(ofSize size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
