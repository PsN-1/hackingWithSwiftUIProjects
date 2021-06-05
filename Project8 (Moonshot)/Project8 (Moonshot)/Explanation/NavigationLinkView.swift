//
//  NavigationLinkView.swift
//  Project8 (Moonshot)
//
//  Created by Pedro Neto on 05/06/21.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView()
    }
}
