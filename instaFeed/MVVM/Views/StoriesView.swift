//
//  StoriesView.swift
//  instaFeed
//
//  Created by Abdul Samad on 28/04/2025.
//

import Foundation
import SwiftUI

struct StoryViews: View {
    var stories: [Stories]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(stories, id: \.self) { story in
                    VStack {
                        StoryCircle()
                        FText(
                            text: story.username,
                            textColor: .white,
                            fontSize: 13,
                            fontWeight: .light
                        )
                    }
                }
            }.padding(.horizontal, 20)
                .padding(.top, 20)
        }
    }
}

fileprivate struct StoryCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    Constants.instaGradient
                )
                .frame(width: 60, height: 60)
            
            Circle()
                .foregroundColor(.black)
                .frame(width: 55, height: 55)
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 55, height: 55)
                .foregroundStyle(.white)
        }
    }
}
