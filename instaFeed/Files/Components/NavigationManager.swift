//
//  NavigationManager.swift
//  instaFeed
//
//  Created by Abdul Samad on 25/04/2025.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    @Published var navigationPath = NavigationPath()
    @Published var modalView: AnyViewWrapper?  // NEW: Optional modal view wrapper
    @Published var isModalPresented = false    // NEW: Track modal presentation
    var viewStack: [AnyViewWrapper] = []
    
    // Navigate to a specific view
    func navigateToView<V: View>(_ view: V, id: String? = nil) {
        let resolvedId = id ?? String(describing: type(of: view))
        let viewWrapper = AnyViewWrapper(view, id: resolvedId)
        
        if viewStack.contains(where: { $0.id == viewWrapper.id }) {
            return
        }
        
        navigationPath.append(viewWrapper)
        viewStack.append(viewWrapper)
    }
    
    // Navigate back to the root view
    func navigateBackToRoot() {
        navigationPath = NavigationPath()
        viewStack.removeAll()
    }
    
    // Navigate back to a specific view in the stack
    func goBackToView<V: View>(_ view: V) {
        if let index = viewStack.firstIndex(where: { type(of: $0.view) == type(of: AnyView(view)) }) {
            viewStack = Array(viewStack.prefix(index + 1))
            navigationPath = NavigationPath(viewStack)
        }
    }
    
    // NEW: Go back to the previous view
    func goBack() {
        if !viewStack.isEmpty {
            viewStack.removeLast()
            if !navigationPath.isEmpty {
                navigationPath.removeLast()
            }
        }
    }
}

struct AnyViewWrapper: Hashable, Identifiable {
    let id: String
    let view: AnyView
    
    init<V: View>(_ view: V, id: String? = nil) {
        self.view = AnyView(view)
        self.id = id ?? String(describing: type(of: view))  // Use type as a stable ID
    }
    
    static func == (lhs: AnyViewWrapper, rhs: AnyViewWrapper) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
