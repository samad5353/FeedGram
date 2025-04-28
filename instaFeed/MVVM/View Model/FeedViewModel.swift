//
//  FeedViewModel.swift
//  instaFeed
//
//  Created by Abdul Samad on 28/04/2025.
//
import Foundation

class FeedViewModel: ObservableObject {
    @Published var feeds: [Feeds] = []
    @Published var stories: [Stories] = []
    
    init() {
        loadMockData()
        loadMockDataForStories()
    }
    
    func loadMockDataForStories() {
        stories = [Stories(username: "abd_sam"), Stories(username: "sam_abd"), Stories(username: "ali_abd"), Stories(username: "ali_abd"), Stories(username: "ali_abd"), Stories(username: "ali_abd"), Stories(username: "ali_abd"), Stories(username: "ali_abd")]
    }
    
    func loadMockData() {
        feeds = [
            Feeds(
                username: "abd_sam",
                caption: "creating a mock data for insta feed",
                likesCount: 10,
                commentsCount: 15,
                mediaType: .photo,
                photoName: "dummyImage",
                videoName: nil
            ),
            Feeds(
                username: "sam_abd",
                caption: "creating a mock data for insta feed",
                likesCount: 10,
                commentsCount: 15,
                mediaType: .video,
                photoName: nil,
                videoName: "sampleVideo"
            ),
            Feeds(
                username: "abd_sam",
                caption: "creating a mock data for insta feed",
                likesCount: 10,
                commentsCount: 15,
                mediaType: .photo,
                photoName: "dummyImage",
                videoName: nil
            ),
            Feeds(
                username: "sam_abd",
                caption: "creating a mock data for insta feed",
                likesCount: 10,
                commentsCount: 15,
                mediaType: .photoAndVideo,
                photoName: "photo2",
                videoName: "sampleVideo"
            )
        ]
    }
}
