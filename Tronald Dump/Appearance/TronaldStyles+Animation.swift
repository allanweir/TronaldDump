//
//  TronaldStyles+Animation.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

extension TronaldStyles {

    struct Animation {
        var duration: Double
        var delay: Double
        var options: UIViewAnimationOptions
        
        static let immediate = Animation(duration: 0, delay: 0, options: [.beginFromCurrentState])
        static let shortest = Animation(duration: 0.15, delay: 0, options: [.beginFromCurrentState, .curveEaseInOut])
        static let short = Animation(duration: 0.25, delay: 0, options: [.beginFromCurrentState, .curveEaseInOut])
        static let `default` = Animation(duration: 0.35, delay: 0, options: [.beginFromCurrentState, .curveEaseInOut])
    }
    
    struct AnimationKeyFrame {
        var duration: Double
        var delay: Double
        var options: UIViewKeyframeAnimationOptions
        
        static let `default` = AnimationKeyFrame(duration: 0.35, delay: 0, options: [.beginFromCurrentState])
    }
    
    struct Transition {
        var duration: Double
        var options: UIViewAnimationOptions
        
        static let immediate = Transition(duration: 0, options: [.beginFromCurrentState, .transitionCrossDissolve, .curveEaseOut])
        static let short = Transition(duration: 0.25, options: [.beginFromCurrentState, .transitionCrossDissolve, .curveEaseOut])
        static let `default` = Transition(duration: 0.35, options: [.beginFromCurrentState, .transitionCrossDissolve, .curveEaseOut])
    }

}
