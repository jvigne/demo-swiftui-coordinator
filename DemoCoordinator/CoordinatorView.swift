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
    let parentCoordinator: Coordinator?
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(rootContentPage, parentCoordinator: parentCoordinator)
                .navigationDestination(for: ContentPage.self) { page in
                    coordinator.build(page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    CoordinatorView(rootContentPage: sheet, parentCoordinator: coordinator)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { cover in
                    CoordinatorView(rootContentPage: cover, parentCoordinator: coordinator)
                }
        }.environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView(rootContentPage: .red, parentCoordinator: nil)
    }
}
