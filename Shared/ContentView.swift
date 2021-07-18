//
//  ContentView.swift
//  Shared
//
//  Created by Eran Gutentag on 16/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            List() {
                Text("Item 1").padding()
                Text("Item 2").padding()
                Text("Item 3").padding()
                Text("Item 4").padding()
            }
            .navigationBarTitle("Geofencer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: NavigationLink("add", destination: MapView()))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

