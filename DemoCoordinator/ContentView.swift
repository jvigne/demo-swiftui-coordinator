//
//  ContentView.swift
//  DemoCoordinator
//
//  Created by Joanna Vigne on 04/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var navigationDelegate: Coordinator
    let bgColor: Color
    let nextPage: ContentPage
    let presentationDelegate: Coordinator?
    
    var body: some View {
        ZStack {
            bgColor
            VStack {
                NavigationLink("push next (link)", value: nextPage)
                Button("push next (button)", action: { navigationDelegate.push(nextPage) })
                Button("present next as Sheet", action: { navigationDelegate.present(sheet: nextPage) })
                Button("present next as FSCover", action: { navigationDelegate.present(fullScreenCover: nextPage) })
                if let presentationDelegate = presentationDelegate {
                    Button("dismiss", action: { presentationDelegate.dismiss() })
                }
            }.buttonStyle(.borderedProminent)
        }.navigationTitle("MyView")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bgColor: .red, nextPage: .blue, presentationDelegate: nil)
    }
}

