//
//  Coordinator.swift
//  DemoCoordinator
//
//  Created by Joanna Vigne on 04/05/2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: [ContentPage] = []
    @Published var sheet: ContentPage?
    @Published var fullScreenCover: ContentPage?
    
    // MARK: - Navigation actions
    
    func push(_ page: ContentPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(sheet: ContentPage) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: ContentPage) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismiss() {
        guard sheet == nil || fullScreenCover == nil else {
            fatalError("Should not have sheet AND fullscreen cover")
        }
        if sheet != nil {
            dismissSheet()
        } else if fullScreenCover != nil {
            dismissFullScreenCover()
        }
    }

    func dismissSheet() {
        sheet = nil
    }

    func dismissFullScreenCover() {
        fullScreenCover = nil
    }

    // MARK: - View Builders

    @ViewBuilder
    func build(_ page: ContentPage, presentationDelegate: Coordinator? = nil) -> some View {
        switch page {
        case .red:
            ContentView(bgColor: .red, nextPage: .blue, presentationDelegate: presentationDelegate)
        case .blue:
            ContentView(bgColor: .blue, nextPage: .yellow, presentationDelegate: presentationDelegate)
        case .yellow:
            ContentView(bgColor: .yellow, nextPage: .green, presentationDelegate: presentationDelegate)
        case .green:
            ContentView(bgColor: .green, nextPage: .black, presentationDelegate: presentationDelegate)
        case .black:
            ContentView(bgColor: .black, nextPage: .red, presentationDelegate: presentationDelegate)
        }
    }
}
