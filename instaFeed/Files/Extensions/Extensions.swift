//
//  Extensions.swift
//  instaFeed
//
//  Created by Abdul Samad on 25/04/2025.
//

import Foundation
import UIKit

extension CGFloat {
    static func scaledFontSize(baseSize: CGFloat, referenceWidth: CGFloat = 430) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return baseSize * (screenWidth / referenceWidth)
    }
    
    static func dynaimcWidthScreenSize(baseSize: CGFloat, referenceWidth: CGFloat = 430) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return baseSize * (screenWidth / referenceWidth)
    }
    
    static func dynaimcHeightScreenSize(baseSize: CGFloat, referenceWidth: CGFloat = 932) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        return baseSize * (screenHeight / referenceWidth)
    }
    
}
