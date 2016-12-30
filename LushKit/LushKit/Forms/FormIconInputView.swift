//
//  FormIconInputView.swift
//  LushKit
//
//  Created by Ashley Cabico on 30/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import FormValidatorSwift

public class FormIconInputView: FormInputView {
    
    let icon: UIImage
    
    
    // MARK: - Initializer
    
    public init(validator: Validator, icon: UIImage, isMandatory: Bool, fieldDescription: String? = nil) {
        
        self.icon = icon
        
        super.init(validator: validator, isMandatory: isMandatory, fieldDescription: fieldDescription)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    
    public override func setup() {
        
        super.setup()
        
        setupIcon()
    }
    
    private func setupIcon() {
        
        textField.leftView = UIImageView(image: icon)
        textField.leftViewMode = .always
    }
}
