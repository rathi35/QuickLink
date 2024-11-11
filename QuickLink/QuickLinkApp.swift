//
//  QuickLinkApp.swift
//  QuickLink
//
//  Created by Rathi on 07/11/24.
//

import SwiftUI

@main
struct QuickLinkApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationTitle("Quick Link")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
