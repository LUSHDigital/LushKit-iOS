//
//  RectangularButton.swift
//  LushKit
//
//  Created by Ashley Cabico on 28/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit


/**
 Use to set button appearance. For a stack of two buttons, use Primary for the top button and Secondary for the bottom.
 
 - Primary: Default style. Black background with white text.
 - Secondary: Black border, white background, and black text.
 - TertiaryPositive: Green background with white text.
 - TertiaryNegative: Red background with white text.
 
 */
public enum RectangularButtonStyle {
    case Primary, Secondary, TertiaryPositive, TertiaryNegative
}

/// A rectagular button with a single line of uppercase text. Font size will automatically adjust to fit within the button on a single line. The intrinsic height of the button is set to kDefaultButtonHeight (see Constants.swift for current value).
public class RectangularButton: BaseButton {
    
    /// Use to set the appearance of the button. Defaults to primary style. Setting a new style will automatically trigger the appearance of the button to change.
    public var buttonStyle = RectangularButtonStyle.Primary {
        
        didSet {
            updateAppearance()
        }
    }
    
    public override var isHighlighted: Bool {
        
        didSet {
            
            let normalWidth: CGFloat
            switch buttonStyle {
            case .Primary, .TertiaryPositive, .TertiaryNegative:
                normalWidth = 0
            case .Secondary:
                normalWidth = kDefaultBorderWidth
            }
            
            layer.borderWidth = isHighlighted ? 0 : normalWidth // hide border if highlighted
        }
    }
    
    public override var isSelected: Bool {
        
        didSet {
            
            let normalWidth: CGFloat
            switch buttonStyle {
            case .Primary, .TertiaryPositive, .TertiaryNegative:
                normalWidth = 0
            case .Secondary:
                normalWidth = kDefaultBorderWidth
            }
            
            layer.borderWidth = isSelected ? 0 : normalWidth // hide border if selected
        }
    }
    
    
    // MARK: - Initializer
    
    public init(style buttonStyle: RectangularButtonStyle) {
        
        self.buttonStyle = buttonStyle
        
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Setup
    
    override public func setup() {
        
        super.setup()
        
        setupAppearance()
        updateAppearance()
    }
    
    private func setupAppearance() {
        
        titleLabel?.font = UIFont.buttonFont
        
        // ensure title always fits
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byTruncatingTail
    }
    
    
    // MARK: - Appearance
    
    /// Ensure title is uppercase only.
    override public func setTitle(_ title: String?, for state: UIControlState) {
        
        let uppercaseTitle = title?.uppercased()
        
        super.setTitle(uppercaseTitle, for: state)
    }
    
    private func updateAppearance() {
        
        switch buttonStyle {
            
        case .Primary:
            layer.borderWidth = 0
            backgroundColor = UIColor.lushBlack
            setTitleColor(UIColor.lushWhite, for: .normal)
            
        case .Secondary:
            layer.borderColor = UIColor.lushBlack.cgColor
            layer.borderWidth = kDefaultBorderWidth
            backgroundColor = UIColor.lushWhite
            setTitleColor(UIColor.lushBlack, for: .normal)
            
        case .TertiaryPositive:
            layer.borderWidth = 0
            backgroundColor = UIColor.lushGreen
            setTitleColor(UIColor.lushWhite, for: .normal)
            
        case .TertiaryNegative:
            layer.borderWidth = 0
            backgroundColor = UIColor.lushRed
            setTitleColor(UIColor.lushWhite, for: .normal)
        }
        
        setBackgroundColor(color: UIColor.lushMediumGray, for: .highlighted)
        setTitleColor(UIColor.lushWhite, for: .highlighted)
        
        setBackgroundColor(color: UIColor.lushMediumGray, for: .selected)
        setTitleColor(UIColor.lushWhite, for: .selected)
    }
    
    
    // MARK: - Update state
    
    override public func updateButtonState() {
        
        if isEnabled {
            
            updateAppearance()
            return
        }
        
        switch buttonStyle {
            
        case .Primary, .TertiaryPositive, .TertiaryNegative:
            layer.borderWidth = 0
            backgroundColor = UIColor.lushLightGray
            setTitleColor(UIColor.lushWhite, for: .normal)
            
        case .Secondary:
            layer.borderColor = UIColor.lushVeryLightGray.cgColor
            layer.borderWidth = kDefaultBorderWidth
            backgroundColor = UIColor.lushWhite
            setTitleColor(UIColor.lushLightGray, for: .normal)
        }
    }
    
    
    // MARK: - Content size
    
    override public var intrinsicContentSize: CGSize {
        
        return CGSize(width: UIViewNoIntrinsicMetric, height: kDefaultButtonHeight)
    }
}
