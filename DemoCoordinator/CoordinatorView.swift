//
//  CoordinatorView.swift
//  DemoCoordinator
//
//  Created by Joanna Vigne on 04/05/2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var navigationDelegate = Coordinator()
    let rootContentPage: ContentPage
    let presentationDelegate: Coordinator?
    
    var body: some View {
        NavigationStack(path: $navigationDelegate.path) {
            navigationDelegate.build(rootContentPage, presentationDelegate: presentationDelegate)
                .navigationDestination(for: ContentPage.self) { page in
                    navigationDelegate.build(page, presentationDelegate: presentationDelegate)
                }
                .sheet(item: $navigationDelegate.sheet) { sheet in
                    CoordinatorView(rootContentPage: sheet, presentationDelegate: navigationDelegate)
                }
                .fullScreenCover(item: $navigationDelegate.fullScreenCover) { cover in
                    CoordinatorView(rootContentPage: cover, presentationDelegate: navigationDelegate)
                }
        }.environmentObject(navigationDelegate)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView(rootContentPage: .red, presentationDelegate: nil)
    }
}
