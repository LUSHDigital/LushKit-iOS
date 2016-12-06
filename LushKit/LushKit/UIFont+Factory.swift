//
//  UIFont+Factory.swift
//  LushKit
//
//  Created by Ashley Cabico on 06/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit

// standard font sizes
public let kFontSmallestSize: CGFloat          = 11.0
public let kFontSmallestSizeLowercase: CGFloat = 13.0
public let kFontMediumSize: CGFloat            = 14.0
public let kFontSmallSize: CGFloat             = 15.0
public let kFontSmallNormalSize: CGFloat       = 16.0
public let kFontNormalSize: CGFloat            = 18.0
public let kFontTwentyTwoSize: CGFloat         = 22.0
public let kFontLargeSize: CGFloat             = 30.0
public let kFontLargerSize: CGFloat            = 47.0
public let kFontLargestSize: CGFloat           = 56.0

public extension UIFont {
    
    public class func boldFontWithSize(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "HelveticaNeue-Bold", size: size)
        
        return font!
    }
    
    public class func regularFontWithSize(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "HelveticaNeue", size: size)
        
        return font!
    }
}
