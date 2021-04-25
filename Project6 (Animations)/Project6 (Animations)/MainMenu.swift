//
//  ContentView.swift
//  Project6 (Animations)
//
//  Created by Pedro Neto on 24/04/21.
//

import SwiftUI

struct MainMenu: View {
    
    var examples = [
        AnyView(Ex01()),
        AnyView(Ex02()),
        AnyView(Ex03()),
        AnyView(Ex04()),
        AnyView(Ex05()),
        AnyView(Ex06()),
        AnyView(Ex07()),
    ]
    
    var body: some View {
        NavigationView {
            List(0..<examples.count) {
                NavigationLink("Animations \($0 + 1)", destination: examples[$0])

            }
            .navigationTitle("Animations")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
