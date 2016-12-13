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
    var heading1Label: UILabel!
    var handwrittenHeading1Label: UILabel!
    var heading2Label: UILabel!
    var handwrittenHeading2Label: UILabel!
    var heading3Label: UILabel!
    var handwrittenHeading3Label: UILabel!
    var bodyCopyLabel: UILabel!
    var miniBodyCopyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView = UIScrollView(frame: CGRect.zero)
        view.addSubview(scrollView)
        
        contentView = UIView(frame: CGRect.zero)
        contentView.backgroundColor = UIColor.white
        scrollView.addSubview(contentView)
        
        let heading1Text = "Heading 1 is 37px with a line height of 42px and -1px letter spacing"
        
        heading1Label = UILabel(frame: CGRect.zero)
        heading1Label.text = heading1Text
        heading1Label.font = UIFont.heading1Font()
        heading1Label.lineBreakMode = .byWordWrapping
        heading1Label.numberOfLines = 0
        
        contentView.addSubview(heading1Label)

        handwrittenHeading1Label = UILabel(frame: CGRect.zero)
        handwrittenHeading1Label.text = heading1Text
        handwrittenHeading1Label.font = UIFont.handwrittenHeading1Font()
        handwrittenHeading1Label.lineBreakMode = .byWordWrapping
        handwrittenHeading1Label.numberOfLines = 0
        contentView.addSubview(handwrittenHeading1Label)
        
        
        let heading2Text = "Heading 2 is 23px with a line height of 31px and -1px letter spacing"
        
        heading2Label = UILabel(frame: CGRect.zero)
        heading2Label.text = heading2Text
        heading2Label.font = UIFont.heading2Font()
        heading2Label.lineBreakMode = .byWordWrapping
        heading2Label.numberOfLines = 0
        contentView.addSubview(heading2Label)
        
        handwrittenHeading2Label = UILabel(frame: CGRect.zero)
        handwrittenHeading2Label.text = heading2Text
        handwrittenHeading2Label.font = UIFont.handwrittenHeading2Font()
        handwrittenHeading2Label.lineBreakMode = .byWordWrapping
        handwrittenHeading2Label.numberOfLines = 0
        contentView.addSubview(handwrittenHeading2Label)
        
        let heading3Text = "Heading 3 is 18px with a line height of 23px and normal letter spacing"
        
        heading3Label = UILabel(frame: CGRect.zero)
        heading3Label.text = heading3Text
        heading3Label.font = UIFont.heading3Font()
        heading3Label.lineBreakMode = .byWordWrapping
        heading3Label.numberOfLines = 0
        contentView.addSubview(heading3Label)
        
        handwrittenHeading3Label = UILabel(frame: CGRect.zero)
        handwrittenHeading3Label.text = heading3Text
        handwrittenHeading3Label.font = UIFont.handwrittenHeading3Font()
        handwrittenHeading3Label.lineBreakMode = .byWordWrapping
        handwrittenHeading3Label.numberOfLines = 0
        contentView.addSubview(handwrittenHeading3Label)
        
        let bodyCopyText = "Body Copy is Helvetica Neue at 14px with a line height of 21px and normal letter spacing"
        
        bodyCopyLabel = UILabel(frame: CGRect.zero)
        bodyCopyLabel.text = bodyCopyText
        bodyCopyLabel.font = UIFont.bodyCopyFont()
        bodyCopyLabel.lineBreakMode = .byWordWrapping
        bodyCopyLabel.numberOfLines = 0
        contentView.addSubview(bodyCopyLabel)
        
        let miniBodyCopyText = "Mini Body Copy is Helvetica Neue at 11px with a line height of 18px and normal letter spacing"
        
        miniBodyCopyLabel = UILabel(frame: CGRect.zero)
        miniBodyCopyLabel.text = miniBodyCopyText
        miniBodyCopyLabel.font = UIFont.miniBodyCopyFont()
        miniBodyCopyLabel.lineBreakMode = .byWordWrapping
        miniBodyCopyLabel.numberOfLines = 0
        contentView.addSubview(miniBodyCopyLabel)
        
        addConstraints()
    }
    
    func addConstraints() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: scrollView.superview, attribute: .top, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: scrollView.superview, attribute: .leading, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: scrollView.superview, attribute: .trailing, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: scrollView.superview, attribute: .bottom, multiplier: 1.0, constant: 0.0)])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: contentView.superview, attribute: .top, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: contentView.superview, attribute: .leading, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: contentView.superview, attribute: .trailing, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: contentView.superview, attribute: .bottom, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: contentView.superview, attribute: .width, multiplier: 1.0, constant: 0.0)])
        
        heading1Label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(NSLayoutConstraint(item: heading1Label, attribute: .top, relatedBy: .equal, toItem: heading1Label.superview, attribute: .top, multiplier: 1.0, constant: kDoubleMargin))
        contentView.addConstraint(NSLayoutConstraint(item: heading1Label, attribute: .leading, relatedBy: .equal, toItem: heading1Label.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView.addConstraint(NSLayoutConstraint(item: heading1Label, attribute: .trailing, relatedBy: .equal, toItem: heading1Label.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))

        handwrittenHeading1Label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(NSLayoutConstraint(item: handwrittenHeading1Label, attribute: .top, relatedBy: .equal, toItem: heading1Label, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
        contentView.addConstraint(NSLayoutConstraint(item: handwrittenHeading1Label, attribute: .leading, relatedBy: .equal, toItem: handwrittenHeading1Label.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView.addConstraint(NSLayoutConstraint(item: handwrittenHeading1Label, attribute: .trailing, relatedBy: .equal, toItem: handwrittenHeading1Label.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))

        heading2Label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(NSLayoutConstraint(item: heading2Label, attribute: .top, relatedBy: .equal, toItem: handwrittenHeading1Label, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
        contentView.addConstraint(NSLayoutConstraint(item: heading2Label, attribute: .leading, relatedBy: .equal, toItem: heading2Label.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView.addConstraint(NSLayoutConstraint(item: heading2Label, attribute: .trailing, relatedBy: .equal, toItem: heading2Label.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))

        handwrittenHeading2Label.translatesAutoresizingMaskIntoConstraints = false
        contentView!.addConstraint(NSLayoutConstraint(item: handwrittenHeading2Label, attribute: .top, relatedBy: .equal, toItem: heading2Label, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
        contentView!.addConstraint(NSLayoutConstraint(item: handwrittenHeading2Label, attribute: .leading, relatedBy: .equal, toItem: handwrittenHeading2Label.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView!.addConstraint(NSLayoutConstraint(item: handwrittenHeading2Label, attribute: .trailing, relatedBy: .equal, toItem: handwrittenHeading2Label.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))
        
        heading3Label.translatesAutoresizingMaskIntoConstraints = false
        contentView!.addConstraint(NSLayoutConstraint(item: heading3Label, attribute: .top, relatedBy: .equal, toItem: handwrittenHeading2Label, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
        contentView!.addConstraint(NSLayoutConstraint(item: heading3Label, attribute: .leading, relatedBy: .equal, toItem: heading3Label.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView!.addConstraint(NSLayoutConstraint(item: heading3Label, attribute: .trailing, relatedBy: .equal, toItem: heading3Label.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))

        handwrittenHeading3Label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(NSLayoutConstraint(item: handwrittenHeading3Label, attribute: .top, relatedBy: .equal, toItem: heading3Label, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
        contentView.addConstraint(NSLayoutConstraint(item: handwrittenHeading3Label, attribute: .leading, relatedBy: .equal, toItem: handwrittenHeading3Label.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView.addConstraint(NSLayoutConstraint(item: handwrittenHeading3Label, attribute: .trailing, relatedBy: .equal, toItem: handwrittenHeading3Label.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))

        bodyCopyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(NSLayoutConstraint(item: bodyCopyLabel, attribute: .top, relatedBy: .equal, toItem: handwrittenHeading3Label, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
        contentView.addConstraint(NSLayoutConstraint(item: bodyCopyLabel, attribute: .leading, relatedBy: .equal, toItem: bodyCopyLabel.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView.addConstraint(NSLayoutConstraint(item: bodyCopyLabel, attribute: .trailing, relatedBy: .equal, toItem: bodyCopyLabel.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))

        miniBodyCopyLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(NSLayoutConstraint(item: miniBodyCopyLabel, attribute: .top, relatedBy: .equal, toItem: bodyCopyLabel, attribute: .bottom, multiplier: 1.0, constant: kDoubleMargin))
        contentView.addConstraint(NSLayoutConstraint(item: miniBodyCopyLabel, attribute: .leading, relatedBy: .equal, toItem: bodyCopyLabel.superview, attribute: .leading, multiplier: 1.0, constant: kDefaultMargin))
        contentView.addConstraint(NSLayoutConstraint(item: miniBodyCopyLabel, attribute: .trailing, relatedBy: .equal, toItem: bodyCopyLabel.superview, attribute: .trailing, multiplier: 1.0, constant: -kDefaultMargin))
        contentView.addConstraint(NSLayoutConstraint(item: miniBodyCopyLabel, attribute: .bottom, relatedBy: .equal, toItem: miniBodyCopyLabel.superview, attribute: .bottom, multiplier: 1.0, constant: -kDoubleMargin))
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        if let labels = contentView.subviews as? [UILabel] {
            for label in labels {
                label.preferredMaxLayoutWidth = view.frame.width - (2 * kDefaultMargin)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

