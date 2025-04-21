//
//  SeaFoodApp.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 20/04/25.
//

import SwiftUI

@main
struct SeaFoodApp: App {
    let factoryView = Factory().make()

    var body: some Scene {
        WindowGroup {
            factoryView
        }
    }
}
