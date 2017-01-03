//
//  FormInputWithClearButtonView.swift
//  LushKit
//
//  Created by Ashley Cabico on 03/01/2017.
//  Copyright © 2017 Lush Ltd. All rights reserved.
//

import Foundation
import UIKit

public class FormInputWithClearButtonView: FormInputView {
    
    // MARK: - Setup
    
    public override func setup() {
        
        super.setup()
        
        setupClearButton()
    }
    
    fileprivate func setupClearButton() {
        
        let clearButton = UIButton()
        clearButton.setImage(UIImage(named: "close"), for: .normal)
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        clearButton.contentMode = .scaleAspectFit
        clearButton.frame = CGRect(x: 0, y: 0, width: kDefaultButtonWidth, height: kDefaultButtonHeight)
        
        textField.rightView = clearButton
        textField.rightViewMode = .whileEditing
    }
    
    
    // MARK: - Actions
    
    @objc fileprivate func clearText() {
        
        textField.text = ""
    }
}
