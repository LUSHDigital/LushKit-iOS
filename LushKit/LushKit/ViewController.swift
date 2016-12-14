//
//  ViewController.swift
//  LushKit
//
//  Created by Ashley Cabico on 06/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import UIKit
import CoreGraphics
import AutoLayoutHelperSwift

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var colorViews = [UIView]()
    var colorLabels = [UILabel]()
    var fontLabels = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        automaticallyAdjustsScrollViewInsets = false
        
        scrollView = UIScrollView(frame: CGRect.zero)
        view.addSubview(scrollView)
        
        contentView = UIView(frame: CGRect.zero)
        scrollView.addSubview(contentView)
        
        addColorViewsAndLabels()
        addFontLabels()
        
        addConstraints()
    }
    
    func addColorViewsAndLabels() {
        
        let colors: [UIColor] = [.lushBlack, .lushDarkGray, .lushWhite, .lushMediumGray, .lushVeryLightGray, .lushLightGray, .lushGreen, .lushRed]
        let colorStrings = [kLushBlackHexString, kLushDarkGrayHexString, kLushWhiteHexString, kLushMediumGrayHexString, kLushVeryLightGrayHexString, kLushLightGrayHexString, kLushGreenHexString, kLushRedHexString]
        
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
            fontLabels.append(label)
            
            contentView.addSubview(label)
        }
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
                
                // add bottom constraint
                
                label.addBottomConstraint(toView: label.superview, attribute: .bottom, relation: .equal, constant: -kDefaultMargin)
                
            } else {
                
                // all intermediate labels: add top constraint only
                
                let previousLabel = fontLabels[index - 1]
                
                label.addTopConstraint(toView: previousLabel, attribute: .bottom, relation: .equal, constant: kDoubleMargin)
            }
            
            // apply leading and trailing constraints to all labels
            
            label.addLeadingConstraint(toView: label.superview, attribute: .leading, relation: .equal, constant: kDefaultMargin)
            label.addTrailingConstraint(toView: label.superview, attribute: .trailing, relation: .equal, constant: -kDefaultMargin)
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

