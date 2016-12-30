//
//  FormTextField.swift
//  LushKit
//
//  Created by Ashley Cabico on 30/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit
import FormValidatorSwift
import QuartzCore

public class FormTextField: ValidatorTextField {
    
    override public init(frame: CGRect, validator: Validator) {
        
        super.init(frame: frame, validator: validator)
        
        self.font = UIFont.bodyCopyFont
        self.textColor = UIColor.lushDarkGray
        self.borderStyle = .line
        self.layer.borderColor = UIColor.lushVeryLightGray.cgColor
        self.layer.borderWidth = kDefaultBorderWidth
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Appearance
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        var rect = super.textRect(forBounds: bounds) // important to take account of any icons/buttons
        let insets = UIEdgeInsets(top: 0, left: kHalfMargin, bottom: 0, right: kHalfMargin)
        
        rect = UIEdgeInsetsInsetRect(rect, insets)
        
        return rect
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        var rect = super.editingRect(forBounds: bounds)
        let insets = UIEdgeInsets(top: 0, left: kHalfMargin, bottom: 0, right: kHalfMargin)
        
        rect = UIEdgeInsetsInsetRect(rect, insets)
        
        return rect
    }
    
    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
        var rect = super.leftViewRect(forBounds: bounds)
        let insets = UIEdgeInsets(top: 0, left: kHalfMargin, bottom: 0, right: -kHalfMargin)
        
        rect = UIEdgeInsetsInsetRect(rect, insets)
        
        return rect
    }
    
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        
        var rect = super.rightViewRect(forBounds: bounds)
        let insets = UIEdgeInsets(top: 0, left: -kHalfMargin, bottom: 0, right: kHalfMargin)
        
        rect = UIEdgeInsetsInsetRect(rect, insets)
        
        return rect
    }
    
    
    // MARK: - Content size
    
    public override var intrinsicContentSize: CGSize {
        
        return CGSize(width: UIViewNoIntrinsicMetric, height: kDefaultButtonHeight)
    }
}
