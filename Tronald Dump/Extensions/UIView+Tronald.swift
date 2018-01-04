//
//  UIView+Tronald.swift
//  Tronald Dump
//
//  Created by Allan Weir on 04/01/2018.
//  Copyright © 2018 Allan Weir. All rights reserved.
//

import UIKit

extension UIView {
    
}

// Animation Helpers
extension UIView {
    
    // Normal Animate
    
    class func animate(using animation: TronaldStyles.Animation, animations: @escaping () -> Void) {
        self.animate(using: animation, animations: animations, completion: nil)
    }
    
    class func animate(using animation: TronaldStyles.Animation, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: animation.duration, delay: animation.delay, options: animation.options, animations: animations, completion: completion)
    }
    
    // Keyframe
    
    class func animateKeyFrames(using animation: TronaldStyles.AnimationKeyFrame, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animateKeyframes(withDuration: animation.duration, delay: animation.delay, options: animation.options, animations: animations, completion: completion)
    }
    
    //Transition
    
    class func transition(with view: UIView, using animation: TronaldStyles.Transition, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.transition(with: view, duration: animation.duration, options: animation.options, animations: animations, completion: completion)
    }
}
