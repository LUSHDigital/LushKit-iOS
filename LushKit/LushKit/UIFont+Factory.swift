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
    
    public class var heading1Font: UIFont {
        
        return UIFont.boldFont(size: kFontHeading1Size)
    }
    
    public class var handwrittenHeading1Font: UIFont {
        
        return UIFont.handwrittenBoldFont(size: kFontHeading1Size)
    }
    
    public class var heading2Font: UIFont {
        
        return UIFont.boldFont(size: kFontHeading2Size)
    }
    
    public class var handwrittenHeading2Font: UIFont {
        
        return UIFont.handwrittenBoldFont(size: kFontHeading2Size)
    }
    
    public class var heading3Font: UIFont {
        
        return UIFont.boldFont(size: kFontHeading3Size)
    }
    
    public class var handwrittenHeading3Font: UIFont {
        
        return UIFont.handwrittenBoldFont(size: kFontHeading3Size)
    }
    
    public class var bodyCopyFont: UIFont {
        
        return UIFont.regularFont(size: kFontBodyCopySize)
    }
    
    public class var miniBodyCopyFont: UIFont {
        
        return UIFont.regularFont(size: kFontMiniBodyCopySize)
    }
    
    // MARK: - Helper methods
    
    class func boldFont(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "HelveticaNeue-Bold", size: size)
        
        return font!
    }
    
    class func regularFont(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "HelveticaNeue", size: size)
        
        return font!
    }
    
    class func handwrittenBoldFont(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "LushHandwritten-Bold", size: size)
        
        return font!
    }
    
    class func handwrittenRegularFont(size: CGFloat) -> UIFont {
        
        let font: UIFont? = UIFont(name: "LushHandwritten-Regular", size: size)
        
        return font!
    }
}
