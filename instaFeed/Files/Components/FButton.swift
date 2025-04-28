//
//  FButton.swift
//  instaFeed
//
//  Created by Abdul Samad on 25/04/2025.
//

import Foundation
import SwiftUI

struct FButton: View {
    var label: String
    @Binding var submitDisabled: Bool
    var action: () -> Void
    
    private let instaGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 245/255, green: 133/255, blue: 41/255),   // Orange
            Color(red: 221/255, green: 42/255, blue: 123/255),   // Pink
            Color(red: 129/255, green: 52/255, blue: 175/255),   // Purple
            Color(red: 81/255, green: 91/255, blue: 212/255)     // Blue
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    private let disableGradient = LinearGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.89, green: 0.91, blue: 0.93), location: 0.00),
            Gradient.Stop(color: Color(red: 0.89, green: 0.91, blue: 0.93), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.55, y: 1),
        endPoint: UnitPoint(x: 0.55, y: 0)
    )
    
    var body: some View {
        Button {
            if !submitDisabled {
                action()
            }
        } label: {
            HStack {
                FText(
                    text: label,
                    textColor: .white,
                    fontSize: 17,
                    fontWeight: .semibold
                )
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, minHeight: 54, maxHeight: 54, alignment: .center)
            .background(
                submitDisabled
                ? disableGradient
                : instaGradient
            )
            .cornerRadius(12)
        }
        .disabled(submitDisabled)
        .buttonStyle(.plain)
    }
}
