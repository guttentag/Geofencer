//
//  GeofencerApp.swift
//  Shared
//
//  Created by Eran Gutentag on 16/07/2021.
//

import SwiftUI

@main
struct GeofencerApp: App {
    let repository = RulesRepository()
    
    var body: some Scene {
        WindowGroup {
            ContentView(repository: repository)
        }
    }
}
