//
//  CoordinatorView.swift
//  DemoCoordinator
//
//  Created by Joanna Vigne on 04/05/2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    let rootContentPage: ContentPage
    let presentationDelegate: Coordinator?
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(rootContentPage, presentationDelegate: presentationDelegate)
                .navigationDestination(for: ContentPage.self) { page in
                    coordinator.build(page, presentationDelegate: presentationDelegate)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    CoordinatorView(rootContentPage: sheet, presentationDelegate: coordinator)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { cover in
                    CoordinatorView(rootContentPage: cover, presentationDelegate: coordinator)
                }
        }.environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView(rootContentPage: .red, presentationDelegate: nil)
    }
}
