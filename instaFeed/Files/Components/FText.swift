//
//  DPText.swift
//  instaFeed
//
//  Created by Abdul Samad on 25/04/2025.
//

import Foundation
import SwiftUI

struct FText: View {
    var text: String
    var textColor: Color = .black
    var textAlignment: TextAlignment = .leading
    var numberOfLines: Int?
    var fontSize: CGFloat
    var lineSpacing: CGFloat = 0
    var fontWeight: Font.Weight = .regular
    var frameAlignment: Alignment = .leading
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.system(size: .scaledFontSize(baseSize: fontSize), weight: fontWeight))
            .multilineTextAlignment(textAlignment)
            .lineSpacing(lineSpacing)
            .lineLimit(numberOfLines ?? nil)
            .truncationMode(.tail)
    }
}
