//
//  Models.swift
//  instaFeed
//
//  Created by Abdul Samad on 28/04/2025.
//
import Foundation

enum MediaType {
    case photo
    case video
    case photoAndVideo
}

struct Feeds: Identifiable, Hashable {
    let id = UUID()
    let username: String
    let caption: String?
    let likesCount: Int
    let commentsCount: Int
    let mediaType: MediaType
    let photoName: String?  // Local photo asset name
    let videoName: String?  // Local video file name
    var isVideo: Bool {
        return mediaType == .video || mediaType == .photoAndVideo
    }
}

struct Stories: Identifiable, Hashable {
    let id = UUID()
    let username: String
    let profilePictureName: String?  = "person.circle.fill"
}
