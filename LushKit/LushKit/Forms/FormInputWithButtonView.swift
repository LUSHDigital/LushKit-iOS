//
//  FormInputWithButtonView.swift
//  LushKit
//
//  Created by Ashley Cabico on 03/01/2017.
//  Copyright © 2017 Lush Ltd. All rights reserved.
//

import Foundation
import FormValidatorSwift

public class FormInputWithButtonView: FormInputView {
    
    public private(set) var button: RectangularButton!
    
    private let buttonTitle: String
    
    
    // MARK: - Initializer
    
    public init(validator: Validator, buttonTitle: String, isMandatory: Bool, fieldDescription: String? = nil) {
        
        self.buttonTitle = buttonTitle
        
        super.init(validator: validator, isMandatory: isMandatory, fieldDescription: fieldDescription)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    public override func setup() {
        
        super.setup()
        
        setupButton()
    }
    
    fileprivate func setupButton() {
        
        button = RectangularButton(style: .Primary)
        button.setTitle(buttonTitle, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: (2 * kDefaultButtonWidth), height: kDefaultButtonHeight)
        
        textField.rightView = button
        textField.rightViewMode = .always
    }
}
