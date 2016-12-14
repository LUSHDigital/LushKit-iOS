//
//  ViewController.swift
//  LushKit
//
//  Created by Ashley Cabico on 06/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var fontLabels = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        scrollView = UIScrollView(frame: CGRect.zero)
        view.addSubview(scrollView)
        
        contentView = UIView(frame: CGRect.zero)
        scrollView.addSubview(contentView)
        
        addFontLabels()
        
        addConstraints()
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
        view.addConstraints([NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: scrollView.superview, attribute: .top, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: scrollView.superview, attribute: .leading, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: scrollView.superview, attribute: .trailing, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: scrollView.superview, attribute: .bottom, multiplier: 1.0, constant: 0.0)])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: contentView.superview, attribute: .top, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: contentView.superview, attribute: .leading, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: contentView.superview, attribute: .trailing, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: contentView.superview, attribute: .bottom, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: contentView.superview, attribute: .width, multiplier: 1.0, constant: 0.0)])
        
        for (index, label) in fontLabels.enumerated() {
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            if index == 0 {
                
                // first label: add top constraint
                
                contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: label.superview, attribute: .top, multiplier: 1.0, constant: kDoubleMargin))
                
                if fontLabels.count == 1 {
                    
                    // only one label: add bottom constraint
                    
                    contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: label.superview, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
                }
                
            } else if index == (fontLabels.count - 1) {
                
                // last label
                
                // add top constraint
                
                if fontLabels.count == 1 {
                    
                    // only one label
                    
                    contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: label.superview, attribute: .top, multiplier: 1.0, constant: kDoubleMargin))
                } else {
                    
                    // multiple labels
                    
                    let previousLabel = fontLabels[index - 1]
                    
                    contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: previousLabel, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
                }
                
                // add bottom constraint
                
                contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: label.superview, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
                
            } else {
                
                // all intermediate labels: add top constraint only
                
                let previousLabel = fontLabels[index - 1]
                
                contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: previousLabel, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
            }
            
            // apply leading and trailing constraints to all labels
            
            contentView.addConstraints([NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: label.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin), NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: label.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin)])
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

