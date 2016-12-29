//
//  BaseControl.swift
//  LushKit
//
//  Created by Ashley Cabico on 29/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit

public class BaseControl: UIControl {
    
    public override var isEnabled: Bool {
        
        didSet {
            updateControlState()
        }
    }
    
    
    // MARK: - Initializers
    
    override public init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        setupConstraints()
        setupAccessibility()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override public func awakeFromNib() {
        
        super.awakeFromNib()
        
        setup()
        setupConstraints()
        setupAccessibility()
    }
    
    
    // MARK: - Setup
    
    /// Abstract method. Subclasses should override this method to setup their subviews.
    public func setup() {
        
    }
    
    
    // MARK: - Layout
    
    /// Abstract method. Subclasses should override this method to add auto layout constraints.
    public func setupConstraints() {
        
    }
    
    
    // MARK: - Accessibility
    
    /// Abstract method. Subclasses should override this method to add accessibility.
    public func setupAccessibility() {
        
    }
    
    
    // MARK: - Update State
    
    /// Abstract method. Subclasses should override this method to change button appearance according to isEnabled state.
    public func updateControlState() {
        
    }
}
