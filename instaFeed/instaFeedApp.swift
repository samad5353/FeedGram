//
//  instaFeedApp.swift
//  instaFeed
//
//  Created by Abdul Samad on 25/04/2025.
//

import SwiftUI

@main
struct instaFeedApp: App {
    @StateObject private var navigationViewModel = NavigationManager.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationViewModel.navigationPath) {
                HomeView()
                    .navigationDestination(for: AnyViewWrapper.self) { wrapper in
                        wrapper.view
                    }
            }
        }
    }
}
