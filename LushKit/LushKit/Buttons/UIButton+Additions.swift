//
//  UIButton+Additions.swift
//  LushKit
//
//  Created by Ashley Cabico on 28/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

extension UIButton {
    
    func setBackgroundColor(color: UIColor, for state: UIControlState) {
        
        // create image using the provided color
        
        let colorRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(colorRect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(colorRect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // set image as background for the provided state
        
        setBackgroundImage(image, for: state)
    }
}
