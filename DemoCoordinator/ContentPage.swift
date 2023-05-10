//
//  ContentPage.swift
//  DemoCoordinator
//
//  Created by Joanna Vigne on 10/05/2023.
//

import Foundation

enum ContentPage: String, Identifiable {
    case red, blue, yellow, green, black

    var id: String {
        self.rawValue
    }
}
