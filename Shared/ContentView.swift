//
//  ContentView.swift
//  Shared
//
//  Created by Eran Gutentag on 16/07/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var repository: RulesRepository
    
    var body: some View {
        let menuItems = repository.rules.map { MenuItem(geofence: $0) }
        NavigationView(content: {
            List(menuItems, id: \.id) { rule in
                NavigationLink(destination: MapView()) {
                    MenuItemView(item: rule)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Geofencer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink("add", destination: MapView()))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repository: RulesRepository())
    }
}
