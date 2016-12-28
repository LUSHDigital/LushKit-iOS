//
//  Constants.swift
//  LushKit
//
//  Created by Ashley Cabico on 06/12/2016.
//  Copyright © 2016 Lush Ltd. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

// margins
public let kDefaultMargin: CGFloat                     = 24.0
public let kDoubleMargin                               = kDefaultMargin * 2.0
public let kHalfMargin                                 = kDefaultMargin / 2.0
public let kQuarterMargin                              = kHalfMargin / 2.0

// text
let kDefaultTextMinimumScaleFactor: CGFloat     = 0.8
let kLargeTextMinimumScaleFactor: CGFloat       = 0.5

// buttons
public let kDefaultButtonWidth: CGFloat                = 44.0
public let kDefaultButtonHeight: CGFloat               = 44.0
public let kButtonPading: CGFloat                      = 30.0

// picker views
public let kDefaultPickerViewRowHeight: CGFloat        = 50.0

// borders
public let kHalfPixel: CGFloat                         = (1.0 / UIScreen.main.scale)
public let kDefaultBorderWidth: CGFloat                = 1.0
public let kDoubleBorderWidth: CGFloat                 = 2.0
public let kBorderViewDefaultHeight: CGFloat           = kHalfPixel

// shading
let kOverlayAlpha: CGFloat                      = 0.26
