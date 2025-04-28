//
//  HomeView.swift
//  instaFeed
//
//  Created by Abdul Samad on 25/04/2025.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        ZStack {
            Color("Background - default") // Background color
                .ignoresSafeArea(.all) // Makes the color extend to the edges of the screen
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    TitleTopBar()
                    StoryViews(stories: viewModel.stories)
                    ForEach(viewModel.feeds, id: \.id) { post in
                        FeedCell(feeds: post)
                    }
                }
                Spacer()
            }
        }
    }
}

fileprivate struct TitleTopBar: View {
    var body: some View {
        HStack(spacing: 12) {
            FText(
                text: "FeedGram",
                textColor: .white,
                fontSize: 16,
                fontWeight: .bold
            )
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundColor(.white)
            }
            Button {
                
            } label: {
                Image(systemName: "message.fill")
                    .foregroundColor(.white)
            }
        }.padding(.horizontal, 24)
    }
}

struct FeedCell: View {
    var feeds: Feeds
    @State private var player: AVPlayer?
    @State private var isVideoVisible: Bool = false
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                FText(
                    text: feeds.username,
                    textColor: .white,
                    fontSize: 15,
                    fontWeight: .semibold
                )
            }.padding(.horizontal, 16)
                .padding(.bottom, 8)
            feedItems
            bottomView
        }
        .padding(.top, 20)
    }
    
    var feedItems: some View {
        GeometryReader { geo in
            ZStack {
                if feeds.isVideo, let videoName = feeds.videoName, let url = Bundle.main.url(forResource: videoName, withExtension: "MP4") {
                    VideoPlayer(player: player)
                        .aspectRatio(9/16, contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: .dynaimcHeightScreenSize(baseSize: 420))
                        .clipped()
                        .onAppear {
                            player = AVPlayer(url: url)
                        }
                        .onChange(of: isVideoVisible, { oldValue, visible in
                            if visible {
                                player?.play()
                            } else {
                                player?.pause()
                            }
                        })
                } else {
                    Image(feeds.photoName ?? "")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: .dynaimcHeightScreenSize(baseSize: 420))
                }
            }
            .frame(height: .dynaimcHeightScreenSize(baseSize: 420))
            .clipped()
            
            .onChange(of: geo.frame(in: .global).midY, { oldValue, midY in
                let screenHeight = UIScreen.main.bounds.height
                isVideoVisible = (midY > 100 && midY < screenHeight - 100)
            })
        }
        .frame(height: .dynaimcHeightScreenSize(baseSize: 420))
        
    }
    
    var bottomView: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "heart")
                            .foregroundColor(.white)
                        
                        FText(
                            text: feeds.likesCount.description,
                            textColor: .white,
                            fontSize: 15,
                            fontWeight: .semibold
                        )
                    }
                }
                
                Button {
                    
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "message")
                            .foregroundColor(.white)
                        
                        FText(
                            text: feeds.commentsCount.description,
                            textColor: .white,
                            fontSize: 15,
                            fontWeight: .semibold
                        )
                    }
                }.buttonStyle(.plain)
            }
            
            FText(
                text: feeds.caption ?? "",
                textColor: .white,
                fontSize: 15,
                fontWeight: .semibold
            ).padding(.top, 20)
        }.padding(.horizontal, 16)
            .padding(.top, 10)
    }
}

#Preview {
    HomeView()
}
