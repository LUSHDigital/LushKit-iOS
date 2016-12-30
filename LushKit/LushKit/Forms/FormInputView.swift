//
//  FormInputView.swift
//  LushKit
//
//  Created by Ashley Cabico on 30/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit
import FormValidatorSwift


public class FormInputView: BaseView {
    
    
    // MARK: - Public properties
    
    public let validator: Validator
    public let isMandatory: Bool
    
    public var fieldDescription: String?
    
    public fileprivate(set) var textField: FormTextField!
    
    // MARK: - Private properties
    
    fileprivate var descriptionLabel: UILabel?
    
    
    // MARK: - Initializer
    
    public init(validator: Validator, isMandatory: Bool, fieldDescription: String? = nil) {
        
        self.validator = validator
        self.isMandatory = isMandatory
        self.fieldDescription = fieldDescription
        
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    public override func setup() {
        
        super.setup()
        
        setupDescriptionLabel()
        setupTextField()
    }
    
    fileprivate func setupDescriptionLabel() {
        
        guard let fieldDescription = fieldDescription else {
            return
        }
        
        descriptionLabel = UILabel()
        descriptionLabel?.font = UIFont.boldFont(size: kFontBodyCopySize)
        descriptionLabel?.textColor = UIColor.lushDarkGray
        descriptionLabel?.textAlignment = .natural
        descriptionLabel?.lineBreakMode = .byWordWrapping
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.text = fieldDescription
        
        addSubview(descriptionLabel!)
    }
    
    fileprivate func setupTextField() {
        
        textField = FormTextField(validator: validator)
        
        addSubview(textField)
    }
    
    
    // MARK: - Layout
    
    public override func setupConstraints() {
        
        super.setupConstraints()
        
        if let descriptionLabel = descriptionLabel {
            
            // pin descriptionLabel to top of view and textField beneath it
            
            descriptionLabel.addTopConstraint(toView: descriptionLabel.superview)
            descriptionLabel.addLeadingConstraint(toView: descriptionLabel.superview)
            descriptionLabel.addTrailingConstraint(toView: descriptionLabel.superview)
            
            textField.addTopConstraint(toView: descriptionLabel, attribute: .bottom, relation: .equal, constant: kHalfMargin)
            textField.addLeadingConstraint(toView: textField.superview)
            textField.addTrailingConstraint(toView: textField.superview)
            textField.addBottomConstraint(toView: textField.superview)
        } else {
            
            textField?.fillSuperView()
        }
    }
    
}
