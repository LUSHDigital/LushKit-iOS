//
//  ViewController.swift
//  LushKit
//
//  Created by Ashley Cabico on 06/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import UIKit
import AutoLayoutHelperSwift
import FormValidatorSwift

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var colorViews = [UIView]()
    var colorLabels = [UILabel]()
    var fontLabels = [UILabel]()
    var rectangularButtons = [RectangularButton]()
    var quantityStepper: QuantityStepper!
    var formInputViews = [FormInputView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.lushWhite
        automaticallyAdjustsScrollViewInsets = false
        
        scrollView = UIScrollView(frame: CGRect.zero)
        view.addSubview(scrollView)
        
        contentView = UIView(frame: CGRect.zero)
        scrollView.addSubview(contentView)
        
        addColorViewsAndLabels()
        addFontLabels()
        addRectangularButtons()
        addQuantityStepper()
        addFormInputViews()
        
        addConstraints()
    }
    
    func addColorViewsAndLabels() {
        
        let colors: [UIColor] = [.lushBlack, .lushDarkGray, .lushWhite, .lushMediumGray, .lushVeryLightGray, .lushLightGray, .lushGreen, .lushRed, .lushYellow]
        let colorStrings = [kLushBlackHexString, kLushDarkGrayHexString, kLushWhiteHexString, kLushMediumGrayHexString, kLushVeryLightGrayHexString, kLushLightGrayHexString, kLushGreenHexString, kLushRedHexString, kLushYellowHexString]
        
        for (index, string) in colorStrings.enumerated() {
            
            let view = UIView(frame: CGRect.zero)
            view.backgroundColor = colors[index]
            if view.backgroundColor == .lushWhite {
                
                // add border
                view.layer.borderColor = UIColor.lushLightGray.cgColor
                view.layer.borderWidth = 1.0
            }
            colorViews.append(view)
            contentView.addSubview(view)
            
            let label = UILabel(frame: CGRect.zero)
            label.font = UIFont.miniBodyCopyFont
            label.text = string
            label.textColor = UIColor.lushDarkGray
            colorLabels.append(label)
            contentView.addSubview(label)
        }
    }
    
    func addFontLabels() {
        
        let heading1Text = "Heading 1 is 37px with a line height of 42px and -1px letter spacing"
        let heading2Text = "Heading 2 is 23px with a line height of 31px and -1px letter spacing"
        let heading3Text = "Heading 3 is 18px with a line height of 23px and normal letter spacing"
        let bodyCopyText = "Body Copy is Helvetica Neue at 14px with a line height of 21px and normal letter spacing"
        let miniBodyCopyText = "Mini Body Copy is Helvetica Neue at 11px with a line height of 18px and normal letter spacing"
        
        let labelStrings = [heading1Text, heading1Text, heading2Text, heading2Text, heading3Text, heading3Text, bodyCopyText, miniBodyCopyText]
        
        let fonts = [UIFont.heading1Font, UIFont.handwrittenHeading1Font, UIFont.heading2Font, UIFont.handwrittenHeading2Font, UIFont.heading3Font, UIFont.handwrittenHeading3Font, UIFont.bodyCopyFont, UIFont.miniBodyCopyFont]
        
        for (index, string) in labelStrings.enumerated() {
            
            let label = UILabel(frame: CGRect.zero)
            label.text = string
            label.font = fonts[index]
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.textColor = UIColor.lushDarkGray
            fontLabels.append(label)
            
            contentView.addSubview(label)
        }
    }
    
    func addRectangularButtons() {
        
        let primaryButton = RectangularButton(style: .Primary)
        primaryButton.setTitle("Primary Button", for: .normal)
        rectangularButtons.append(primaryButton)
        contentView.addSubview(primaryButton)
        
        let secondaryButton = RectangularButton(style: .Secondary)
        secondaryButton.setTitle("Secondary Button", for: .normal)
        rectangularButtons.append(secondaryButton)
        contentView.addSubview(secondaryButton)
        
        let tertiaryPositiveButton = RectangularButton(style: .TertiaryPositive)
        tertiaryPositiveButton.setTitle("Tertiary Positive Button", for: .normal)
        rectangularButtons.append(tertiaryPositiveButton)
        contentView.addSubview(tertiaryPositiveButton)
        
        let tertiaryNegativeButton = RectangularButton(style: .TertiaryNegative)
        tertiaryNegativeButton.setTitle("Tertiary Negative Button", for: .normal)
        rectangularButtons.append(tertiaryNegativeButton)
        contentView.addSubview(tertiaryNegativeButton)
    }
    
    func addQuantityStepper() {
        
        quantityStepper = QuantityStepper()
        contentView.addSubview(quantityStepper)
    }
    
    func addFormInputViews() {
        
        let input1 = FormInputView(validator: AlphabeticValidator(), isMandatory: false)
        input1.textField.placeholder = "Alphabetic field"
        formInputViews.append(input1)
        contentView.addSubview(input1)
        
        let input2 = FormInputView(validator: EmailValidator(), isMandatory: false, fieldDescription: "Email")
        input2.textField.placeholder = "Enter email"
        input2.textField.shouldAllowViolation = true
        input2.textField.validateOnFocusLossOnly = true
        formInputViews.append(input2)
        contentView.addSubview(input2)
        
        let input3 = FormIconInputView(validator: AlphabeticValidator(), icon: UIImage(named: "search")!, isMandatory: false)
        input3.textField.placeholder = "Enter search term"
        formInputViews.append(input3)
        contentView.addSubview(input3)
    }
    
    func addConstraints() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addTopConstraint(toView: scrollView.superview, attribute: .top, relation: .equal, constant: 0)
        scrollView.addLeadingConstraint(toView: scrollView.superview, attribute: .leading, relation: .equal, constant: 0)
        scrollView.addTrailingConstraint(toView: scrollView.superview, attribute: .trailing, relation: .equal, constant: 0)
        scrollView.addBottomConstraint(toView: scrollView.superview, attribute: .bottom, relation: .equal, constant: 0)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.fillSuperView()
        contentView.addWidthConstraint(toView: scrollView)
        
        // color views and labels
        
        for (index, view) in colorViews.enumerated() {
            
            let label = colorLabels[index] // color label corresponding to the color view
            
            view.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            
            // all labels should be pinned to their color view and its leading edge
            
            label.addTopConstraint(toView: view, attribute: .bottom, relation: .equal, constant: kHalfMargin)
            label.addLeadingConstraint(toView: view, attribute: .leading, relation: .equal, constant: 0)
            
            // set view width to be same as that of the first view so all are equal 
            
            if index != 0 {
                
                view.addWidthConstraint(toView: colorViews.first!)
            }
            
            // set view height and width to be equal
            
            contentView.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0))
            
            // display in rows of 2 with corresponding label left aligned below each view
            
            if (index % 2) == 0 {
                
                // even index
                
                view.addLeadingConstraint(toView: view.superview, attribute: .leading, relation: .equal, constant: kDefaultMargin)
                
                if index == 0 {
                    
                    // top row so pin to top of superview
                    
                    view.addTopConstraint(toView: view.superview, attribute: .top, relation: .equal, constant: kDoubleMargin)
                } else {
                    
                    // pin to bottom of label from the row above
                    
                    let aboveLabel = colorLabels[index - 2]
                    view.addTopConstraint(toView: aboveLabel, attribute: .bottom, relation: .equal, constant: kDefaultMargin)
                }
                
            } else {
                
                // odd index
                
                let previousView = colorViews[index - 1]
                
                view.addLeadingConstraint(toView: previousView, attribute: .trailing, relation: .equal, constant: kDefaultMargin)
                view.addTrailingConstraint(toView: view.superview, attribute: .trailing, relation: .equal, constant: -kDefaultMargin)
            }
            
            // add top constraint
            
            if index < 2 {
                
                // top row so pin to top of superview
                
                view.addTopConstraint(toView: view.superview, attribute: .top, relation: .equal, constant: kDoubleMargin)
            } else {
                
                // pin to bottom of label from the row above
                
                let aboveLabel = colorLabels[index - 2]
                view.addTopConstraint(toView: aboveLabel, attribute: .bottom, relation: .equal, constant: kDefaultMargin)
            }
        }
        
        // add bottom constraint to bottom row labels
        
        let lastLabel = colorLabels.last!
        lastLabel.addBottomConstraint(toView: fontLabels.first!, attribute: .top, relation: .equal, constant: -kDoubleMargin)
        
        if colorViews.count % 2 == 0 {
            
            // even number of views, so second to last view on bottom row as well
            
            let penultimateLabel = colorLabels[colorLabels.count - 2]
            penultimateLabel.addBottomConstraint(toView: fontLabels.first!, attribute: .top, relation: .equal, constant: -kDoubleMargin)
        }
        
        // font labels
        
        for (index, label) in fontLabels.enumerated() {
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            if index == 0 {
                
                // first label: add top constraint
                
                label.addTopConstraint(toView: colorLabels.last, attribute: .bottom, relation: .equal, constant: kDoubleMargin)
                
                if fontLabels.count == 1 {
                    
                    // only one label: add bottom constraint
                    
                    label.addBottomConstraint(toView: label.superview, attribute: .bottom, relation: .equal, constant: kDefaultMargin)
                }
                
            } else if index == (fontLabels.count - 1) {
                
                // last label
                
                // add top constraint
                
                if fontLabels.count == 1 {
                    
                    // only one label
                    
                    label.addTopConstraint(toView: colorLabels.last, attribute: .bottom, relation: .equal, constant: kDoubleMargin)
                } else {
                    
                    // multiple labels
                    
                    let previousLabel = fontLabels[index - 1]
                    
                    label.addTopConstraint(toView: previousLabel, attribute: .bottom, relation: .equal, constant: kDoubleMargin)
                }
                
            } else {
                
                // all intermediate labels: add top constraint only
                
                let previousLabel = fontLabels[index - 1]
                
                label.addTopConstraint(toView: previousLabel, attribute: .bottom, relation: .equal, constant: kDoubleMargin)
            }
            
            // apply leading and trailing constraints to all labels
            
            label.addLeadingConstraint(toView: label.superview, attribute: .leading, relation: .equal, constant: kDefaultMargin)
            label.addTrailingConstraint(toView: label.superview, attribute: .trailing, relation: .equal, constant: -kDefaultMargin)
        }
        
        // Rectangular Buttons
        
        for (index, button) in rectangularButtons.enumerated() {
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            // add top constraint
            
            if index == 0 {
                
                // first button
                button.addTopConstraint(toView: fontLabels.last, attribute: .bottom, relation: .equal, constant: kDoubleMargin)
                
            } else {
                
                // all other buttons pin to previous button
                
                let previousButton = rectangularButtons[index - 1]
                
                button.addTopConstraint(toView: previousButton, attribute: .bottom, relation: .equal, constant: kDefaultMargin)
            }
            
            // apply leading and trailing constraints to all buttons
            
            button.addLeadingConstraint(toView: button.superview, attribute: .leading, relation: .equal, constant: kDefaultMargin)
            button.addTrailingConstraint(toView: button.superview, attribute: .trailing, relation: .equal, constant: -kDefaultMargin)
        }
        
        // Quantity stepper
        
        quantityStepper.translatesAutoresizingMaskIntoConstraints = false
        
        quantityStepper.addTopConstraint(toView: rectangularButtons.last, attribute: .bottom, relation: .equal, constant: kDefaultMargin)
        quantityStepper.addLeadingConstraint(toView: quantityStepper.superview, attribute: .leading, relation: .equal, constant: kDefaultMargin)
        quantityStepper.addTrailingConstraint(toView: quantityStepper.superview, attribute: .trailing, relation: .equal, constant: -kDefaultMargin)
        
        // Form input views
        
        for (index, view) in formInputViews.enumerated() {
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            // add top constraint
            
            if index == 0 {
                
                // first view
                view.addTopConstraint(toView: quantityStepper, attribute: .bottom, relation: .equal, constant: kDefaultMargin)
                
            } else {
                
                // all other views pin to previous view
                
                let previousView = formInputViews[index - 1]
                
                view.addTopConstraint(toView: previousView, attribute: .bottom, relation: .equal, constant: kDefaultMargin)
            }
            
            // add bottom constraint if last view
            
            if index == (formInputViews.count - 1) {
                
                view.addBottomConstraint(toView: view.superview, attribute: .bottom, relation: .equal, constant: -kDefaultMargin)
            }
            
            // apply leading and trailing constraints to all buttons
            
            view.addLeadingConstraint(toView: view.superview, attribute: .leading, relation: .equal, constant: kDefaultMargin)
            view.addTrailingConstraint(toView: view.superview, attribute: .trailing, relation: .equal, constant: -kDefaultMargin)
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        for label in fontLabels {
            label.preferredMaxLayoutWidth = view.frame.width - (2 * kDefaultMargin) // need to get label to wrap text correctly
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

