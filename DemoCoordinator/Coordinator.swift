//
//  Coordinator.swift
//  DemoCoordinator
//
//  Created by Joanna Vigne on 04/05/2023.
//

import SwiftUI

enum ContentPage: String, Identifiable {
    case red, blue, yellow, green, black
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
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
    
    func dismissSheet() {
        sheet = nil
    }
    
    func dismissFullScreenCover() {
        fullScreenCover = nil
    }
    
    // MARK: - View Builders
    
    @ViewBuilder
    func build(_ page: ContentPage, parentCoordinator: Coordinator? = nil) -> some View {
        switch page {
        case .red:
            ContentView(bgColor: .red, nextPage: .blue, parentCoordinator: parentCoordinator)
        case .blue:
            ContentView(bgColor: .blue, nextPage: .yellow, parentCoordinator: parentCoordinator)
        case .yellow:
            ContentView(bgColor: .yellow, nextPage: .green, parentCoordinator: parentCoordinator)
        case .green:
            ContentView(bgColor: .green, nextPage: .black, parentCoordinator: parentCoordinator)
        case .black:
            ContentView(bgColor: .black, nextPage: .red, parentCoordinator: parentCoordinator)
        }
    }
}
