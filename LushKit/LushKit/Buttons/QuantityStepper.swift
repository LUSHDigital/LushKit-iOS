//
//  QuantityStepper.swift
//  LushKit
//
//  Created by Ashley Cabico on 29/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit

/** A simplified rectangular stepper using `Int` values with decrement button on the leading end, current value label centered in the middle, and increment button on the trailing end.
    
    - note: If the `value` is set programmatically to be greater than the `maximumValue` or less than the `minimumValue`, the `value` will be changed to equal the maximum or minimum accordingly.
 */
public class QuantityStepper: BaseControl {
    
    
    // MARK: - Public properties
    
    /// The default value for this property is `0`.
    public var value: Int = 0 {
        
        didSet {
            
            if self.value < self.minimumValue {
                self.value = self.minimumValue
            } else if self.value > self.maximumValue {
                self.value = self.maximumValue
            }
            
            self.updateAppearance()
        }
    }
    
    /// The default value for this property is `0`. Must be numerically less than maximumValue.
    public var minimumValue: Int = 0 {
        
        didSet {
            assert(minimumValue < maximumValue, "minimumValue must be less than maximumValue")
        }
    }
    
    /// The default value for this property is `10`. Must be numerically greater than minimumValue
    public var maximumValue: Int = 10 {
        
        didSet {
            assert(maximumValue > minimumValue, "maximumValue must be greater than minimumValue")
        }
    }
    
    /// The default value for this property is `1`. Must be greater than `0`.
    public var stepValue: Int = 1 {
        
        didSet {
            assert(stepValue > 0, "quantityStepper stepValue must be greater than 0")
        }
    }
    
    
    // MARK: - Private properties
    
    fileprivate var decrementButton: UIButton!
    fileprivate var incrementButton: UIButton!
    fileprivate var valueLabel: UILabel!
    
    
    // MARK: - Setup
    
    public override func setup() {
        
        super.setup()
        
        layer.borderWidth = kDefaultBorderWidth
        layer.borderColor = UIColor.lushBlack.cgColor
        
        setupDecrementButton()
        setupIncrementButton()
        setupValueLabel()
        
        updateAppearance()
    }
    
    fileprivate func setupDecrementButton() {
        
        decrementButton = UIButton()
        decrementButton.setImage(UIImage(named: "minus"), for: .normal)
        addSubview(decrementButton)
        
        decrementButton.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
    }
    
    fileprivate func setupIncrementButton() {
        
        incrementButton = UIButton()
        incrementButton.setImage(UIImage(named: "plus"), for: .normal)
        addSubview(incrementButton)
        
        incrementButton.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
    }
    
    fileprivate func setupValueLabel() {
        
        valueLabel = UILabel()
        valueLabel.font = UIFont.bodyCopyFont
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.numberOfLines = 1
        valueLabel.lineBreakMode = .byTruncatingTail
        valueLabel.textAlignment = .center
        addSubview(valueLabel)
    }
    
    
    // MARK: - Layout 
    
    public override func setupConstraints() {
        
        super.setupConstraints()
        
        // add constraints for views in one line moving from leading to trailing ends
        
        setupDecrementButtonConstraints()
        setupValueLabelConstraints()
        setupIncrementButtonConstraints()
    }
    
    fileprivate func setupDecrementButtonConstraints() {
        
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        
        decrementButton.addTopConstraint(toView: decrementButton.superview, attribute: .top, relation: .equal, constant: 0)
        decrementButton.addLeadingConstraint(toView: decrementButton.superview, attribute: .leading, relation: .equal, constant: 0)
        decrementButton.addBottomConstraint(toView: decrementButton.superview, attribute: .bottom, relation: .equal, constant: 0)
        
        decrementButton.addWidthConstraint(toView: nil, constant: kDefaultButtonWidth)
    }
    
    fileprivate func setupIncrementButtonConstraints() {
        
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        
        incrementButton.addTopConstraint(toView: incrementButton.superview, attribute: .top, relation: .equal, constant: 0)
        incrementButton.addLeadingConstraint(toView: valueLabel, attribute: .trailing, relation: .equal, constant: kDefaultMargin)
        incrementButton.addTrailingConstraint(toView: incrementButton.superview, attribute: .trailing, relation: .equal, constant: 0)
        incrementButton.addBottomConstraint(toView: incrementButton.superview, attribute: .bottom, relation: .equal, constant: 0)
        
        incrementButton.addWidthConstraint(toView: nil, constant: kDefaultButtonWidth)
    }
    
    fileprivate func setupValueLabelConstraints() {
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        valueLabel.addTopConstraint(toView: valueLabel.superview, attribute: .top, relation: .equal, constant: 0)
        valueLabel.addLeadingConstraint(toView: decrementButton, attribute: .trailing, relation: .equal, constant: kDefaultMargin)
        valueLabel.addBottomConstraint(toView: valueLabel.superview, attribute: .bottom, relation: .equal, constant: 0)
    }
    
    
    // MARK: - Appearance
    
    fileprivate func updateAppearance() {
        
        valueLabel.text = String(value)
        
        // compare to max/min values and disable/enable buttons if neccessary
        
        decrementButton.isEnabled = (value == minimumValue) ? false : true
        incrementButton.isEnabled = (value == maximumValue) ? false : true
    }
    
    
    // MARK: - Actions
    
    @objc fileprivate func buttonPressed(button: UIButton) {
        
        var newValue = value
        
        if button == decrementButton {
            
            newValue -= stepValue
            
        } else if button == incrementButton {
            
            newValue += stepValue
        }
        
        value = newValue
        
        updateAppearance()
        sendActions(for: .valueChanged)
    }
    
    
    // MARK: - Content size
    
    public override var intrinsicContentSize: CGSize {
        
        return CGSize(width: UIViewNoIntrinsicMetric, height: kDefaultButtonHeight)
    }
}
