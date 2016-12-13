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
public let kFontHeading1Size: CGFloat       = 37.0
public let kFontHeading2Size: CGFloat       = 23.0
public let kFontHeading3Size: CGFloat       = 18.0
public let kFontBodyCopySize: CGFloat       = 14.0
public let kFontMiniBodyCopySize: CGFloat   = 11.0

public extension UIFont {
    
    public class func handwrittenHeading1Font() -> UIFont {
        
        let font = UIFont.handwrittenBoldFontWithSize(size: kFontHeading1Size)
        
        return font
    }
    
    public class func heading1Font() -> UIFont {
        
        let font = UIFont.boldFontWithSize(size: kFontHeading1Size)
        
        return font
    }
    
    public class func heading2Font() -> UIFont {
        
        let font = UIFont.boldFontWithSize(size: kFontHeading2Size)
        
        return font
    }
    
    public class func handwrittenHeading2Font() -> UIFont {
        
        let font = UIFont.handwrittenBoldFontWithSize(size: kFontHeading2Size)
        
        return font
    }
    
    public class func heading3Font() -> UIFont {
        
        let font = UIFont.boldFontWithSize(size: kFontHeading3Size)
        
        return font
    }
    
    public class func handwrittenHeading3Font() -> UIFont {
        
        let font = UIFont.handwrittenBoldFontWithSize(size: kFontHeading3Size)
        
        return font
    }
    
    public class func bodyCopyFont() -> UIFont {
        
        let font = UIFont.regularFontWithSize(size: kFontBodyCopySize)
        
        return font
    }
    
    public class func miniBodyCopyFont() -> UIFont {
        
        let font = UIFont.regularFontWithSize(size: kFontMiniBodyCopySize)
        
        return font
    }
    
    // MARK: - Helper methods
    
    class func boldFontWithSize(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "HelveticaNeue-Bold", size: size)
        
        return font!
    }
    
    class func regularFontWithSize(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "HelveticaNeue", size: size)
        
        return font!
    }
    
    class func handwrittenBoldFontWithSize(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "LushHandwritten-Bold", size: size)
        
        return font!
    }
    
    class func handwrittenRegularFontWithSize(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "LushHandwritten-Regular", size: size)
        
        return font!
    }
}
