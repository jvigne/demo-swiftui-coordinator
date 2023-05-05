//
//  ContentView.swift
//  DemoCoordinator
//
//  Created by Joanna Vigne on 04/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let bgColor: Color
    let nextPage: ContentPage
    let parentCoordinator: Coordinator?
    
    var body: some View {
        ZStack {
            bgColor
            VStack {
                NavigationLink("push next (link)", value: nextPage)
                Button("push next (button)", action: { coordinator.push(nextPage) })
                Button("present next as Sheet", action: { coordinator.present(sheet: nextPage) })
                Button("present next as FSCover", action: { coordinator.present(fullScreenCover: nextPage) })
                if let parentCoordinator = parentCoordinator {
                    Button("dismissSheet", action: { parentCoordinator.dismissSheet() })
                    Button("dismissCover", action: { parentCoordinator.dismissFullScreenCover() })
                }
            }.buttonStyle(.borderedProminent)
        }.navigationTitle("MyView")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bgColor: .red, nextPage: .blue, parentCoordinator: nil)
    }
}

