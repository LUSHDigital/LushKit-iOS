//
//  UIColor+Factory.swift
//  LushKit
//
//  Created by Ashley Cabico on 14/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift


// constants
let kLushBlackHexString             = "#000000"
let kLushDarkGrayHexString          = "#333333"
let kLushWhiteHexString             = "#FFFFFFF"
let kLushMediumGrayHexString        = "#8F8F8F"
let kLushLightGrayHexString         = "#CECECE"
let kLushVeryLightGrayHexString     = "#EAEAEA"
let kLushGreenHexString             = "#00A44C"
let kLushRedHexString               = "#D0021B"

public extension UIColor {
    
    public class var lushBlack: UIColor {
        
        return UIColor(kLushBlackHexString)
    }
    
    public class var lushDarkGray: UIColor  {
        
        return UIColor(kLushDarkGrayHexString)
    }
    
    public class var lushWhite: UIColor {
        
        return UIColor(kLushWhiteHexString)
    }
    
    public class var lushMediumGray: UIColor {
        
        return UIColor(kLushMediumGrayHexString)
    }
    
    public class var lushLightGray: UIColor {
        
        return UIColor(kLushLightGrayHexString)
    }
    
    public class var lushVeryLightGray: UIColor {
        
        return UIColor(kLushVeryLightGrayHexString)
    }
    
    public class var lushGreen: UIColor {
        
        return UIColor(kLushGreenHexString)
    }
    
    public class var lushRed: UIColor {
        
        return UIColor(kLushRedHexString)
    }
}
